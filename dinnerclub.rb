require 'pry'

class DinnerClub

def initialize(group)
  @group = group
end

def group_list
  @group_list = {}
  @group.each { |m| @group_list[m] = 0 }
  @group_list
end

def event(person, bill)
  @person = person
  event_check = CheckSplitter.new(bill, person.length)
  person.each do |a| 
    @group_list[a] += event_check.per_person
  end
  @group_list
end
end

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
  
  def per_person
    total / num_of_people
  end
end 

group = DinnerClub.new(["Derek","Hilary","Brett","Dawn"]) 
group.group_list
group.event(["Derek", "Hilary", "Brett", "Dawn"], 150)
group.event(["Derek", "Hilary"], 50)
group.event(["Derek", "Brett"], 200)

binding.pry
  