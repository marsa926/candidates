# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidate.find {|candidate| candidate[:id] == id}
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def languages?(candidate)
  candidate[:languages].include? ('Ruby' || 'Python')
end

def date_applied?(candidate)

  candidate[:date_applied].to_time.to_i >= 152.days.ago.to_date.to_time.to_i
end

def age?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)

  # candidates.select {|candidate| cage?}

  #  && github_points?(candidate) && languages?(candidate) && date_applied?(candidate) && experienced?(candidate)}
  candidates.each do |candidate|
    if age?(candidate) && github_points?(candidate) && languages?(candidate) && date_applied?(candidate) && experienced?(candidate)
    pp candidate
    end
  end
end

def ordered_by_experience_points(candidates)

  candidates = candidates.sort_by {|candidate| [candidate[:years_of_experience], candidate[:github_points]]}.reverse
  pp candidates
end