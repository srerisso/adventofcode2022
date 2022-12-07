# ****************************************************************
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

# ****************************************************************
# METHODS, FUNCTIONS and others

# Function find_dupes : Function to find duplicate in a text string
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
# puts a
# puts priorities[:a]
sum_priorities = 0

a.each do |el|
   priority = priorities[el.to_sym]
   sum_priorities = sum_priorities + priority
end

printf("PART 1 sum of priorities is: %d\n", sum_priorities)

# ****************************************************************
# ********* PART 2 
# groups of 3 elves

# 1. split file_data in groups of 3
# puts("FILE DATA: ",file_data)
b=[]
sum_priorities_2=0
priority2=0

while !file_data.empty?
    fd = file_data.pop(3)
    fd.map {|element| element.chars }
    # printf("fd[0] %s \n", fd[0])
    # printf("fd[1] %s \n", fd[1])
    # printf("fd[2] %s \n", fd[2])
    b.push(fd[0].chars.intersection(fd[1].chars,fd[2].chars))

    # if !val.empty?
    #     total += val
    # end
end

b.each do |el|
    priority2 = priorities[el[0].to_sym]
    sum_priorities_2 += priority2
    # print(el[0])
 end
 
#  priorities.each do |d|
#     print(d).value
#  end
 printf("PART 2 sum of priorities is: %d\n", sum_priorities_2)

# 2. each el of group, explode it in chars 
# 3. intersect three arrays
