class CarsController < ApplicationController
  def create
    # Only if we have the right parameters will we make a new car
    #if there are make and model_year parameters
    if !params[:make].nil? && !params[:model_year].nil?
      make = params[:make]
      model_year = params[:model_year]
      #use parameters to make the new Car
      @car = Car.new(make, model_year)
      #store into cookies
      cookies[:car] = @car.to_yaml
    else
      #if there is car in the cookies
      if !cookies[:car].nil?
        #take Car from the cookies
        @car = YAML.load(cookies[:car])
      else
        #if there is no car in the cookies and no parameters
        redirect_to '/'
      end
    end
  end

  def accelerate
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    redirect_to '/cars/create'
  end

  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    redirect_to '/cars/create'
  end


end
