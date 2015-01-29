require 'pry'
require_relative 'checksplitter'
require_relative 'person'

# Track members of the dining club
# Track spending
# Track outings
# Let individual members treat their dining group

class DiningClub
  
  def initialize
    @members = {}
  end
  
  def add_member(member)  
    @members[member] = Person.new(member)
    @members
  end

  def show_members
    @members.each do |member, objs|
      puts member
    end
    @members
  end
  
  def remove_member(member)
    @members.delete(member)
    @members
  end
  
  def have_an_outting(total, tip, *diners)
    cs = CheckSplitter.new(total, tip, diners.length)
    amount_per_person = cs.per_person
    
    diners.each do |diner|
      if @members.include?(diner)
        @members[diner].spend(amount_per_person)
      else
        add_member(diner)
        @members[diner].spend(amount_per_person)
      end
    end
    @members
  end

  def get_spending_report(member)
    @members[member]
  end

end

binding.pry