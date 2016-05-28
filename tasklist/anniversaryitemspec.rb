require 'rspec'
require_relative 'anniversaryitem'
require_relative 'task'

describe 'AnniversaryItem' do
# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: Do not use Date to store the date.

  it "should create a to do item for an anniversary" do
    expect{AnniversaryItem.new}.to_not raise_error
  end

  it "should have a month" do
    an_item = AnniversaryItem.new
    expect(an_item.month).to be_a Numeric
  end

  it "should have a day" do
    an_item = AnniversaryItem.new
    expect(an_item.day).to be_a Numeric
  end

  it "should be able to change day" do
    an_item = AnniversaryItem.new
    an_item.set_date(7,7)
    expect(an_item.day).to eq 7
    expect(an_item.month).to eq 7
  end


  it "display the date as a string" do
    an_item = AnniversaryItem.new
    an_item.set_date(6,15)
    expect(an_item.date).to eq "June 15"
  end

  # Story: As a developer, I can print an item for an anniversary with field labels and values.
   it "should return the field labels and values with annieversary included" do
     an_item = AnniversaryItem.new
     an_item.set_date(4,18)
     an_item.title = "Walk the dogs"
     an_item.description = "1 hour"
     expect(an_item.display_task).to eq "Title: Walk the dogs \n Description: 1 hour \n Date: April 18"
   end

   it "should have a due date" do
     an_item = AnniversaryItem.new
     expect(an_item.due_date).to be_a Date
   end

   it "should have the same month and day for the date and the due date" do
     an_item = AnniversaryItem.new
     expect(an_item.due_date.mon).to eq an_item.month
     expect(an_item.due_date.day).to eq an_item.day
   end

  it "should set the year of the due date to the year when that date will occur next" do
    an_item = AnniversaryItem.new
    an_item.set_date(3,10)
    expect(an_item.due_date.year).to eq 2017
  end

  it "should add one to the year of the due date when a date is marked as done" do
    an_item = AnniversaryItem.new
    an_item.set_date(3,10)
    expect(an_item.due_date.year).to eq 2017
    an_item.done
    expect(an_item.due_date.year).to eq 2018
  end

end #end of Anniversary
