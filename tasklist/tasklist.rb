class Tasklist
  def initialize
    @tasks = []
    @to_do_items = []
    @anniversaryitems = []
  end

  def tasks
    @tasks
  end

  def add_task new_task
    @tasks.push(new_task)
  end

  def show_completed
    @tasks.select { |element| element.done == true }
  end

  def show_not_completed
    @tasks.select { |element| element.done == false }
  end

  def to_do_items
    @to_do_items
  end

  def add_to_do_item new_item
    @to_do_items.push(new_item)
  end

  def not_done_due_today
    @to_do_items.select { |element| element.done == false && element.due_date == Date.today}
  end

  def not_completed_by_date
    @to_do_items.select { |element| element.done == false }.sort_by { |element| element.due_date }
  end

  def everything_not_completed
    @to_do_items.select { |element| element.done == false }.sort_by { |element| element.due_date } + @tasks.select { |element| element.done == false }
  end

  def anniversaryitems
    @anniversaryitems
  end

  def add_anniversary_item new_item
    @anniversaryitems.push(new_item)
  end

  def not_completed_plus_anniversary
    @to_do_items.select { |element| element.done == false }.sort_by { |element| element.due_date } + @anniversaryitems.select { |element| element.month == Date.today.mon}
  end

  def full_list
    @to_do_items.select { |element| element.done == false }.sort_by { |element| element.due_date } + @anniversaryitems.select { |element| element.month == Date.today.mon} + @tasks.select { |element| element.done == false }
  end

end #end of Tasklist
