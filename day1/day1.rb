file = File.open("input.txt")
file_data = file.readlines.map(&:chomp)
# print(file_data)

sum_file_data = []
sum = 0

file_data.each do |el|
    if el == ""
        sum_file_data.push(sum)
        sum = 0
    else
        sum = sum + el.to_i
    end
end

print(sum_file_data.max)

# PART 2

ordered_sum_file_data = sum_file_data.sort
print(ordered_sum_file_data)
print(ordered_sum_file_data.pop(3).sum)
