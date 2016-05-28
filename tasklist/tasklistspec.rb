require 'rspec'
require_relative 'tasklist'
require_relative 'task'
require_relative 'todoitem'
require_relative 'anniversaryitem'

# Story: As a developer, I can add all of my Tasks to a TaskList.
describe 'Tasklist' do

  it "should create a Task List" do
    expect{Tasklist.new}.to_not raise_error
  end

  it "should hold list of tasks" do
    a_tasklist = Tasklist.new
    expect(a_tasklist.tasks).to be_a Array
  end

  it "should add a task to a list of tasks" do
    a_tasklist = Tasklist.new
    a_task = Task.new
    a_tasklist.add_task(a_task)
    expect(a_tasklist.tasks).to include a_task
  end
  # Story: As a developer with a TaskList, I can show all the completed items.
  it "should show all the completed tasks" do
    a_tasklist = Tasklist.new
    a_task = Task.new
    expect(a_task.done).to be false
    a_tasklist.add_task(a_task)
    expect(a_task.done).to be false
    another_task = Task.new
    a_tasklist.add_task(another_task)
    another_task.done = true
    expect(a_task.done).to be false
    expect(a_tasklist.show_completed).to eq [another_task]
  end
  # Story: As a developer with a TaskList, I can show all the not completed items.
  it "should show all the not completed items" do
    a_tasklist = Tasklist.new
    a_task = Task.new
    expect(a_task.done).to be false
    a_tasklist.add_task(a_task)
    expect(a_task.done).to be false
    another_task = Task.new
    a_tasklist.add_task(another_task)
    another_task.done = true
    expect(a_task.done).to be false
    expect(a_tasklist.show_not_completed).to eq [a_task]
  end
  # Story: As a developer, I can add items with due dates to my TaskList.
  # Hint: Consider keeping items with due dates separate from the other items.
  it "should hold to do items in an array" do
    a_tasklist = Tasklist.new
    expect(a_tasklist.to_do_items).to be_a Array
  end

  it "should be able to add to do items to the array" do
    a_tasklist = Tasklist.new
    an_item = To_Do_Item.new
    a_tasklist.add_to_do_item(an_item)
    expect(a_tasklist.to_do_items).to include an_item
  end
  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
  it "should list all the not completed items that are due today" do
    a_tasklist = Tasklist.new
    an_item = To_Do_Item.new #due today, not complete
    an_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    another_item = To_Do_Item.new #due today, complete
    another_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    another_item.done = true
    third_item = To_Do_Item.new #not due today, not complete
    a_tasklist.add_to_do_item(an_item)
    a_tasklist.add_to_do_item(another_item)
    a_tasklist.add_to_do_item(third_item)
    expect(a_tasklist.not_done_due_today).to eq [an_item]
  end
  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it "should list all the not completed items in order of due date" do
    a_tasklist = Tasklist.new
    an_item = To_Do_Item.new # not completed, due Jun 10
    an_item.set_due_date(2018,6,10)
    second_item = To_Do_Item.new #not completed, due today
    second_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item = To_Do_Item.new # completed, due today
    third_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item.done = true
    fourth_item = To_Do_Item.new
    fourth_item.set_due_date(2016,6,10)
    a_tasklist.add_to_do_item(an_item)
    a_tasklist.add_to_do_item(second_item)
    a_tasklist.add_to_do_item(third_item)
    a_tasklist.add_to_do_item(fourth_item)
    expect(a_tasklist.not_completed_by_date).to eq [second_item, fourth_item, an_item]
  end
  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  it "can show all the not completed items in order of due date, and then the items without due dates" do
    a_tasklist = Tasklist.new
    a_task = Task.new #not completed, no due date
    a_tasklist.add_task(a_task)
    another_task = Task.new # completed, no due date
    a_tasklist.add_task(another_task)
    another_task.done = true
    an_item = To_Do_Item.new # not completed, due Jun 10
    an_item.set_due_date(2016,6,10)
    second_item = To_Do_Item.new #not completed, due today
    second_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item = To_Do_Item.new # completed, due today
    third_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item.done = true
    a_tasklist.add_to_do_item(an_item)
    a_tasklist.add_to_do_item(second_item)
    a_tasklist.add_to_do_item(third_item)
    expect(a_tasklist.everything_not_completed).to eq [second_item, an_item, a_task]
  end

  # Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
  it "should have an array for anniversary items" do
    a_tasklist = Tasklist.new
    expect(a_tasklist.anniversaryitems).to be_a Array
  end

  it "should be able to add items to the anniversaryitems array" do
    a_tasklist = Tasklist.new
    an_item = AnniversaryItem.new
    a_tasklist.add_anniversary_item(an_item)
    expect(a_tasklist.anniversaryitems).to include an_item
  end
  it "should list all the not completed items in order of due date and yearly dates for the current month" do
    a_tasklist = Tasklist.new
    an_item = To_Do_Item.new # not completed, due Jun 10
    an_item.set_due_date(2016,6,10)
    second_item = To_Do_Item.new #not completed, due today
    second_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item = To_Do_Item.new # completed, due today
    third_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item.done = true
    fourth_item = AnniversaryItem.new
    fourth_item.set_date(Date.today.mon, Date.today.day+1)
    fifth_item = AnniversaryItem.new
    fifth_item.set_date(8,10)
    a_tasklist.add_to_do_item(an_item)
    a_tasklist.add_to_do_item(second_item)
    a_tasklist.add_to_do_item(third_item)
    a_tasklist.add_anniversary_item(fourth_item)
    a_tasklist.add_anniversary_item(fifth_item)
    expect(a_tasklist.not_completed_plus_anniversary).to eq [second_item, an_item, fourth_item]
  end
  # Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
  it "can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates" do
    a_tasklist = Tasklist.new
    a_task = Task.new
    another_task = Task.new
    another_task.done = true
    a_tasklist.add_task(a_task)
    a_tasklist.add_task(another_task)
    an_item = To_Do_Item.new # not completed, due Jun 10
    an_item.set_due_date(2016,6,10)
    second_item = To_Do_Item.new #not completed, due today
    second_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item = To_Do_Item.new # completed, due today
    third_item.set_due_date(Date.today.year, Date.today.mon, Date.today.day)
    third_item.done = true
    fourth_item = AnniversaryItem.new
    fourth_item.set_date(Date.today.mon, Date.today.day+1)
    fifth_item = AnniversaryItem.new
    fifth_item.set_date(8,10)
    a_tasklist.add_to_do_item(an_item)
    a_tasklist.add_to_do_item(second_item)
    a_tasklist.add_to_do_item(third_item)
    a_tasklist.add_anniversary_item(fourth_item)
    a_tasklist.add_anniversary_item(fifth_item)
    expect(a_tasklist.full_list).to eq [second_item, an_item, fourth_item, a_task]
    p a_tasklist.full_list
  end
end
