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

  def event(place, person, bill)
    @place = place
    @person = person
    event_check = CheckSplitter.new(bill, person.length)
    person.each do |a| 
      @group_list[a] += event_check.per_person
    end
    @group_list
  end

  def location
    location = {}
    location[@place] = @person
    location
  end

  def treat_everyone(place, person, bill, pay)
    @place = place
    @person = person
    @pay = pay
    event_check = CheckSplitter.new(bill, person.length)
    person.each do |a| 
      if a = pay
        group_list[a] += event_check.total
      else
        a = 0
      end
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

fun_group = DinnerClub.new(["Derek","Hilary","Brett","Dawn"]) 
fun_group.group_list
fun_group.treat_everyone("Lot 2", ["Derek", "Hilary", "Brett", "Dawn"], 150, "Derek")
fun_group.location

dull_group = DinnerClub.new(["Bill", "Tom", "Jason"])
dull_group.group_list
dull_group.treat_everyone("Burger King", ["Bill", "Tom"], 35, "Tom")

binding.pry
  