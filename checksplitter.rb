require 'pry'
#create new class
class CheckSplitter
  
  attr_accessor :tip, :cost, :people
  
  def initialize(cost, people) #initialized both the cost & # of people
    @cost = cost
    @tip = @cost * 0.2 #set default value for tip
    @people = people
    @total = total
  end
  
  def new_tip(x) #calculate new tip 
    @tip = x
  end
  
  def total
    @cost + @tip 
  end
  
  def per_person
    per_person = total / people
    per_person.ceil.to_i
  end
  
end 
binding.pry


