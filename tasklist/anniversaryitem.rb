require_relative 'task'

class AnniversaryItem < Task

  def initialize
    super
    @day = 1
    @month = 1
    @due_date = Date.new(1,1,1)
    @year = 1
  end

  def date
    Date::MONTHNAMES[@month] + " " + @day.to_s
  end

  def month
    @month
  end

  def day
    @day
  end

  def set_date (new_month, new_day)
    @day = new_day
    @month = new_month
    if Date.new(Date.today.year, @month, @day) < Date.today
      @year = Date.today.year + 1
    else
      @year = Date.today.year
    end
    @due_date = Date.new(@year, @month, @day)
  end

  def year
    @year
  end

  def display_task
    "Title: #{@title} \n Description: #{@description} \n Date: " + self.date
  end

  def due_date
    @due_date
  end

  def done
    @year += 1
    @due_date = Date.new(@year, @month, @day)
  end
end
