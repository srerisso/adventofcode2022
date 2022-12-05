# Day 3
file = File.open("day3_input.txt")
file_data = file.readlines.map(&:chomp)
# print(file_data)

# each el
# 1. size/2
# 2. find duplicate value in each part => find_dupes()
# 3. assign priority
# 4. sum all priorities

# find_dupes: find duplicate in a text string
def find_dupes(text)
    # puts(text.size/2)
    part1 = text[0,text.size/2]
    part2 = text[(text.size/2),text.size/2]
    puts("PART1: $1 and PART2: $2", part1, part2)
    part1.each_char do |char1|
        if i2 = part2.index(char1)
            h2 = part2.split
            puts("PRIORITY of:",h2[i2])
        end
    end

end

file_data.each do |el|
    find_dupes(el)
end


