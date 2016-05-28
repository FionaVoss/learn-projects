require 'rspec'
require_relative 'task'



# Starting User Stories
#
# Story: As a developer, I can create a Task.
describe Task do
  it "should create a Task" do
    expect{Task.new}.to_not raise_error
  end

  # Story: As a developer, I can give a Task a title and retrieve it.
  it "should retrieve the task title" do
    a_task = Task.new
    expect(a_task.title).to be_a String
  end

  it "should give a task a title" do
    a_task = Task.new
    a_task.title = "New Task"
    expect(a_task.title).to eq "New Task"
  end
  # Story: As a developer, I can give a Task a description and retrieve it.
  it "should have a description" do
    a_task = Task.new
    expect(a_task.title).to be_a String
  end

  it "should have a method to change the description" do
    a_task = Task.new
    a_task.description = "Walk the dogs"
    expect(a_task.description).to eq "Walk the dogs"
  end
  # Story: As a developer, I can print a Task with field labels and values.
  # Story: As a developer, when I print a Task its done status is shown.
  it "should have a method to return the task as a string with field labels and values" do
    a_task = Task.new
    a_task.title = "Walk the dogs"
    a_task.description = "1 hour"
    expect(a_task.display_task).to eq "Title: Walk the dogs \n Description: 1 hour \n Status: Not done"
    a_task.done = true
    expect(a_task.display_task).to eq "Title: Walk the dogs \n Description: 1 hour \n Status: Done"
  end
  # Story: As a developer, I can mark a Task done.
  it "should have a done status" do
    a_task = Task.new
    expect(a_task.done).to be false
  end

  it "should have a method to mark the task as done" do
    a_task = Task.new
    a_task.done = true
    expect(a_task.done).to be true
  end
end #end of Task class
