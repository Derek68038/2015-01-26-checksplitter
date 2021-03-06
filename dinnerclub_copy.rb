require 'pry'
# Class: DinnerClub
#
# Create a dinner club group and keep track of their tabs & where they go.
#
# Attributes:
# @group    - String: the group of people who are in the dinner club.

class DinnerClub
  
  attr_accessor :location
  
  def initialize(group)
    @group = group
    @location = {}
  end

  # Public: #group_list
  # Creates empty hash which uses each club member in group as key and zero as value.
  #
  # Parameters:
  # none
  #
  # Returns:
  # A hash with group members as keys and 0, for their starting balance, as values.
  #
  # State_Changes:
  # Sets @group as hash keys
  
  def group_list
    @group_list = {}
    @group.each { |m| @group_list[m] = 0 }
    @group_list
  end
  
  # Public: #event
  
  def event(place, person, bill)
    @place = place
    @person = person
    @location[@place] = @person
    event_check = CheckSplitter.new(bill, person.length)
    person.each do |a| 
      @group_list[a] += event_check.per_person
    end
    @group_list
  end
  
  def locations
    @location[@place] = @person
    @location
  end
  
  # def location
#     location = {}
#     location[@place] = @person
#     location
#   end

  def treat_everyone(place, person, bill, pay)
    @place = place
    @person = person
    @pay = pay
    @location[@place] = @person
    event_check = CheckSplitter.new(bill, person.length)
    person.each do |a| 
      if a == pay
        @group_list[a] += event_check.total
      else
        a == 0
      end
    end
   @group_list
  end
end

class CheckSplitter
  
  attr_accessor :cost

  def initialize(cost, people) #initialized both the cost & # of people
    @cost = cost
    @tip = @cost * 0.2 #set default value for tip
    @people = people
    @total = total
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

  def print_output
    puts "Each person owes: $" + sprintf("%.2f", per_person)
  end
end

  

binding.pry
  
  