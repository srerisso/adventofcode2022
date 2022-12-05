# Day 3
file = File.open("day3_input.txt")
file_data = file.readlines.map(&:chomp)
print(file_data)

# each el
# 1. size/2
# 2. find duplicate value in each part => find_dupes()
# 3. assign priority
# 4. sum all priorities

# find_dupes: find duplicate in a text string
def find_dupes(text)
    puts(text.size)
end

file_data.each do |el|
    find_dupes(el)
end


