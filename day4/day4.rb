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

total=0

file_data.each do |el|
    (range1,range2) = el.split(",")
    ra1 = translateRange(range1)
    ra2 = translateRange(range2)
    if (ra1.intersection(ra2) != [])
        total += 1
    end
    printf("*** R1 is %s \n *** R2 is %s \n COUNT: %s\n\n", ra1,ra2,total)

end

print("Total assignment pairs fully containing the other: ", total)