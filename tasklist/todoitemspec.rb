require 'rspec'
require_relative 'todoitem'
require_relative 'task'


# Story: As a developer, I can create a to do item with a due date, which can be changed.
# Hint: Use the Date class
describe 'To_Do_Item' do

  it "should create a new to do item" do
    expect{To_Do_Item.new}.to_not raise_error
  end

  it "should have a due date" do
    an_item = To_Do_Item.new
    expect(an_item.due_date).to be_a Date
  end

  it "should get a due date one month from today when it is initialized" do
    an_item = To_Do_Item.new
    expect(an_item.due_date). to eq Date.today + 30
  end

  it "should be able to change the due date" do
    an_item = To_Do_Item.new
    an_item.set_due_date(2016,6,8)
    expect(an_item.due_date.year).to eq 2016
    expect(an_item.due_date.mon).to eq 6
    expect(an_item.due_date.mday).to eq 8
  end

  it "should say how many days are left until an item is due" do
    an_item = To_Do_Item.new
    an_item.set_due_date((Date.today + 30).year, (Date.today + 30).month, (Date.today + 30).day)
    expect(an_item.days_left).to eq 30
  end

  # Story: As a developer, I can print an item with a due date with field labels and values.
  it "should display a to do item with field labels and values" do
    an_item = To_Do_Item.new
    expect(an_item.done).to be false
    an_item.title = "Walk the dogs"
    an_item.description = "1 hour"
    an_item.set_due_date(2016,6,8)
    expect(an_item.display_task).to eq "Title: Walk the dogs \n Description: 1 hour \n Status: Not done \n Due Date: Wed Jun 08 2016"
    an_item.done = true
    expect(an_item.display_task).to eq "Title: Walk the dogs \n Description: 1 hour \n Status: Done \n Due Date: Wed Jun 08 2016"
  end

end
