# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'
def find(id)
  @candidates.each {|can| if can[:id] == id; return can; end}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def ruby_or_python?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

def applied_15_days_ago?(candidate)
  candidate[:date_applied] > 15.days.ago.to_date
end

def over_age_17?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
  # Your code Here
  qualified_candidates = []
  candidates.each do |can|
      if experienced?(can) &&
      github_points?(can) &&
      ruby_or_python?(can) &&
      applied_15_days_ago?(can) &&
      over_age_17?(can)
        qualified_candidates.push(can)
      end
  end
  return qualified_candidates
end

def ordered_by_qualifications(candidates)
  candidates.sort { |can_a, can_b| [can_b[:years_of_experience],can_b[:github_points]] <=> [can_a[:years_of_experience],can_a[:github_points]]}
end

# More methods will go below
# class Foo

#   def dude
#     # do something dude
#   end

#   def self.yo
#     # do something yo
#   end
# end

# Foo.yo

# foo = Foo.new
# foo.dude # this will call dude
# Foo.dude