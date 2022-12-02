file = File.open("day2_input.txt")
file_data = file.readlines.map(&:chomp)
# print(file_data)

# Eliminate whitespaces between each play
# a = ["B Y", "B X", "B X"] to a = ["BY","BX","BX"]
new_file_data = []

file_data.each do |el|
    new_file_data.push((el.gsub(/\s+/, "")))
end

print(new_file_data)