class CarMakerController < ApplicationController
  def make_car
    if params.has_key?(:make_input) && params.has_key?(:year_input)
      # got a make and year, but make might be empty
      if params[:make_input].strip.empty? || params[:year_input].strip.empty?
        # got a make and year, but make and/or year is empty
        flash.now[:notice] = "Missing make and/or year"
      else
        #got a valid make and year
        @make = params[:make_input]
        @year = params[:year_input]
        @car = Car.new(@make,@year)
        cookies[:car] = @car.to_yaml
        redirect_to '/car_sim/simulate'
        # flash.now[:notice] = @car.to_s
      end
    end
  end
end
