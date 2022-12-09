# --- Day 4: Camp Cleanup ---
file = File.open("day4_input.txt")
file_data = file.readlines.map(&:chomp)

# puts file_data
# In how many assignment pairs does one range fully contain the other?

# Function translateRange: translate Integer1-Integer2 to Array[*(Integer1..Integer2)]
def translateRange str
    if !(str.empty?)
        (r1,r2)=str.split('-')
        Array[*(r1..r2)]
    end
end

require 'set'
class Array
    def included_in? array
      array.to_set.superset?(self.to_set)
    end
end

total=0

file_data.each do |el|
    (range1,range2) = el.split(",")
    ra1 = translateRange(range1)
    ra2 = translateRange(range2)
    if ra1.included_in?(ra2) || ra2.included_in?(ra1)
        total += 1
    end
    # printf("*** R1 is %s \n *** R2 is %s. \n TOTAL: %d \n\n", ra1,ra2,total)
end

printf("Total assignment pairs fully containing the other: %d \n", total)

# ****************************************************************
# ********* PART 2
# How many pairs OVERLAP ???

print("****** PART 2 ******")
total2=0
file_data.each do |el|
    (range1,range2) = el.split(",")
    ra1 = translateRange(range1)
    ra2 = translateRange(range2)
    if ra1.any? { |el| ra2.include?(el) }
        total2 += 1
    end
    # printf("++ RA1: %s \n",ra1)
    # printf("-- RA2: %s \n\n",ra2)
    printf("*** R1 is %s \n *** R2 is %s. \n TOTAL: %d \n\n", ra1,ra2,total2)
end

printf("Total assignment pairs overlapping in some part: %d \n", total2)