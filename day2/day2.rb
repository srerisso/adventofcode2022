#  Rock     A   X
#  Paper    B   Y
#  Scissors C   Z

file = File.open("day2_input.txt")
file_data = file.readlines.map(&:chomp)
# print(file_data)

# Eliminate whitespaces between each play
# Transform a = ["B Y", "B X", "B X"] to a = ["BY","BX","BX"]

new_file_data = []

file_data.each do |el|
    new_file_data.push((el.gsub(/\s+/, "")))
end

# print(new_file_data)

# Win tuples: AY, BZ, CX
# Draw tuples : AX, BY, CZ
# Loss tuples: AZ, BX, CY

# score_outcome
# Win 6
# Draw 3
# Loss 0
# 
# score_shape
# Rock (X) 1
# Paper (Y) 2
# Scissors (Z) 3

# Total score = score_shape + score_outcome
# AY => 6+2 , BZ => 6+3, CX => 6+1
# AX => 3+1 , BY => 3+2  , CZ => 3+3
# AZ => 0+3 , BX => 0+1 , CY => 0+2

sum=0
new_file_data.each do |el|
    case el
    when "AY"
        sum = sum + 8
    when "BZ"
        sum = sum + 9
    when "CX"
        sum = sum + 7
    when "AX"
        sum = sum + 4
    when "BY"
        sum = sum + 5
    when "CZ"
        sum = sum + 6
    when "AZ"
        sum = sum + 3
    when "BX"
        sum = sum + 1
    when "CY"
        sum = sum +2
    end
end

puts("SUM is ", sum)

# PART 2.
#  Rock     A
#  Paper    B
#  Scissors C 

# score_outcome
# Win   (Z) 6
# Draw  (Y) 3
# Loss  (X) 0
# 
# score_shape
# Rock      (A) 1
# Paper     (B) 2
# Scissors  (C) 3

# "X means you need to lose, 
# Y means you need to end the round in a draw, 
# and Z means you need to win. Good luck!"
# 
# A > C > B > A
# Rock > Scissors > Paper > Rock
# 
# what would your total score be if everything goes exactly according to your strategy guide?
# A X => C, score = 0 + 3
# A Y => A, score = 3 + 1
# A Z => B, score = 6 + 2
# B X => A, score = 0 + 1
# B Y => B, score = 3 + 2
# B Z => C, score = 6 + 3
# C X => B, score = 0 + 2
# C Y => C, score = 3 + 3
# C Z => A, score = 6 + 1


sum2=0
new_file_data.each do |el|
    case el
    when "AX"
        sum2 = sum2 + 3
    when "AY"
        sum2 = sum2 + 4
    when "AZ"
        sum2 = sum2 + 8
    when "BX"
        sum2 = sum2 + 1
    when "BY"
        sum2 = sum2 + 5
    when "BZ"
        sum2 = sum2 + 9
    when "CX"
        sum2 = sum2 + 2
    when "CY"
        sum2 = sum2 + 6
    when "CZ"
        sum2 = sum2 + 7
    end
end

puts("SUM2 is ", sum2)

