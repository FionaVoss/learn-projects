require_relative 'task'

class To_Do_Item < Task

  def initialize
    super
    @due_date = Date.today + 30
  end

  def due_date
    @due_date
  end

  def set_due_date(year, month, day)
    @due_date = Date.new(year,month,day)
  end

  def days_left
    @due_date - Date.today
  end

  def display_task
    if @done == false
      "Title: #{@title} \n Description: #{@description} \n Status: Not done \n Due Date: " + @due_date.strftime('%a %b %d %Y')
    else
      "Title: #{@title} \n Description: #{@description} \n Status: Done \n Due Date: " + @due_date.strftime('%a %b %d %Y')
    end
  end

end
