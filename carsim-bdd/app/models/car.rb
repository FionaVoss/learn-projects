class Car

  def initialize(make, model_year)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = false
  end

  def make
    @make
  end

  def model_year
    @model_year
  end

  def speed
    @speed
  end

  def accelerate
    @speed += 10
  end

  def brake
    if @speed > 7
      @speed -= 7
    else
      @speed = 0
    end
  end

  def lights
    @lights
  end
end
