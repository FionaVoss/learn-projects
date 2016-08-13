class Car
  def initialize (make, year)
    @make = make
    @year = year
    @speed = 0
    @lights = false
    @parking_brake = false
  end

  def make
    @make
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def parking_brake
    @parking_brake
  end

  def lights
    if @lights == true
      "On"
    else
      "Off"
    end
  end

  def toggle_lights
    @lights = !@lights
  end

  def accelerate
    @speed += 10
  end

  def brake
    if @speed < 7
      @speed = 0
    else
      @speed -= 7
    end
  end

  def toggle_parking_brake= input
    @parking_brake = input
  end
end
