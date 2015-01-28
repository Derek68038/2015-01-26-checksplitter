  

require 'pry'
#create new class
class CheckSplitter
  def initialize(cost, people) #initialized both the cost & # of people
    @cost = cost
    @tip = @cost * 0.2 #set default value for tip
    @people = people
    @total = total
  end
  
  def get_cost
    @cost
  end
  
  def new_tip(x) #calculate new tip 
    @tip = x
  end
  
  def num_of_people
    @people
  end 
  
  def total
    @cost + @tip 
  end
  
  def return
    total / @people
  end
end  

dinner = CheckSplitter.new(100, 4)
dinner.return

dinner.new_tip(30)
dinner.return

binding.pry


