class ApartmentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :check_only_creator_can_execute, only: [:update, :destroy, :edit]
  load_and_authorize_resource

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all
    # @apartments_with_coords = Apartment.where("latitude IS NOT NULL")
    # @apartments.each do |apartment|
    #   if !apartment.latitude.nil? && !apartment.longitude.nil?
    #     @apartments_with_coords << apartment
    #   end
    # end
    @hash = Gmaps4rails.build_markers(@apartments.where.not(latitude: nil)) do |apartment, marker|
        marker.lat apartment.latitude
        marker.lng apartment.longitude
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show

  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create

    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_only_creator_can_execute
    if !check_only_creator_can_see(@apartment, current_user)
      render text: "no way Wall-E"
    end
  end

  def check_only_creator_can_see(apartment, current_user)
    (!apartment.user.nil? && current_user == apartment.user) || (!current_user.nil? && (current_user.has_role? :admin))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:street_address, :city, :state, :zip_code, :contact_name, :contact_email, :latitude, :longitude, :image)
    end

end