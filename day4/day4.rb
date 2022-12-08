# --- Day 4: Camp Cleanup ---
file = File.open("day4_input.txt")
file_data = file.readlines.map(&:chomp)

# puts file_data
# In how many assignment pairs does one range fully contain the other?

# Function translateRange: translate Integer1-Integer2 to Array[*(Integer1..Integer2)]
def translateRange(str)
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
totalArray = []

file_data.each do |el|
    (range1,range2) = el.split(",")
    ra1 = translateRange(range1)
    ra2 = translateRange(range2)
    if ra1.included_in?(ra2) || ra2.included_in?(ra1)
        total += 1
    end
    #  totalArray.push(ra1)
    printf("*** R1 is %s \n *** R2 is %s. \n TOTAL: %d \n\n", ra1,ra2,total)
end

printf("Total assignment pairs fully containing the other:%d ", total)