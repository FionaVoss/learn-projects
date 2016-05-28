class Task
  def initialize
    @title = ""
    @description = ""
    @done = false
  end

  def title
    @title
  end

  def title=new_title
    @title = new_title
  end

  def description
    @description
  end

  def description=new_description
    @description = new_description
  end

  def display_task
    if @done == false
      "Title: #{@title} \n Description: #{@description} \n Status: Not done"
    else
      "Title: #{@title} \n Description: #{@description} \n Status: Done"
    end
  end

  def done
    @done
  end

  def done=input
    @done = input
  end
end
