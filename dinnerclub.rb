require 'pry'
# Class: DinnerClub
#
# Create a dinner club group and keep track of their tabs & where they go.
#
# Attributes:
# @group    - String:  The group of people who are in the dinner club.
# @location - Hash:    Receives place as the key and who went there as the values. 

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
  # Takes 3 arguments & places each person in the location hash. Then assigns a variable
  # called event_check as the CheckSplitter oject & iterates over each person in that 
  # event to calculate how much each person owes.
  #
  # Parameters:
  # place      - String:  The restaurant name.
  # person     - Array:   Who went to the restaurant.
  # bill       - Integer: How much the total bill was, without tip.
  #
  # Returns:
  # group_list: Who's in the dinner club and how much have they spent total.
  #
  # State Changes:
  # Sets event_check as the object CheckSplitter with it's two arguments.
  
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
  
  # Public: #locations
  # Places each place name in a hash as the key and the people who went there as values.
  #
  # Parameters:
  # None
  #
  # Returns:
  # location: A hash of what restaurants the club went to and who went where.
  #
  # State Changes:
  # None
  
  def locations
    @location[@place] = @person
    @location
  end

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
  
  