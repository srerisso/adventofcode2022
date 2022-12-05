# Day 3
file = File.open("day3_input.txt")
file_data = file.readlines.map(&:chomp)
# print(file_data)

# each el
# 1. size/2
# 2. find duplicate value in each part => find_dupes()
# 3. assign priority
# 4. sum all priorities

priorities = Hash.new
priorities = { a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10, k:11, l:12, m:13, n:14, o:15, p:16, q:17, r:18, s:19, t:20, u:21, v:22, w:23, x:24, y:25, z:26, A:27, B:28, C:29, D:30, E:31, F:32, G:33, H:34, I:35, J:36, K:37, L:38, M:39, N:40, O:41, P:42, Q:43, R:44, S:45, T:46, U:47, V:48, W:49, X:50, Y:51, Z:52 }


# find_dupes: find duplicate in a text string
def find_dupes(text)
    # puts(text.size/2)
    part1 = text[0,text.size/2]
    part2 = text[(text.size/2),text.size/2]
    # puts("PART1 is " + part1 + " and PART2 is " + part2)
    part1.each_char do |char1|
        if i2 = part2.index(char1)
            # puts("Duplicate char:" + part2[i2])
            return part2[i2]
        end
    end

end

a = []
file_data.each do |el|
    # puts find_dupes(el)
    a.push(find_dupes(el))
end

puts a
# puts priorities[:a]
sum_priorities = 0

a.each do |el|
   priority = priorities[el.to_sym]
   sum_priorities = sum_priorities + priority
end

puts sum_priorities