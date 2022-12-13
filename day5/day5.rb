# --- Day 5: Supply Stacks ---
# Q : After the rearrangement procedure completes what crate ends up on top of each stack?

# Read File in a String.
# Only read stacks movements
file = File.open("day5_input_movements.txt")
stacks_movements = file.readlines(chomp: true)
# print(stacks_movements)

# Translate Stacks starting state to a data type readable bu algorithm. Rewrite stacks as an ARRAY of ARRAYS
# [G]                 [D] [R]        
# [W]         [V]     [C] [T] [M]    
# [L]         [P] [Z] [Q] [F] [V]    
# [J]         [S] [D] [J] [M] [T] [V]
# [B]     [M] [H] [L] [Z] [J] [B] [S]
# [R] [C] [T] [C] [T] [R] [D] [R] [D]
# [T] [W] [Z] [T] [P] [B] [B] [H] [P]
# [D] [S] [R] [D] [G] [F] [S] [L] [Q]
#  1   2   3   4   5   6   7   8   9 

STACK1 = ["D","T","R","B","J","L","W","G"]  #["DTRBJLWG"]
STACK2 = ["S","W","C"]                      #["SWC"]
STACK3 = ["R","Z","T","M"]                  #["RZTM"]
STACK4 = ["D","T","C","H","S","P","V"]      #["DTCHSPV"]
STACK5 = ["G","P","T","L","D","Z"]          #["GPTLDZ"]
STACK6 = ["F","B","R","Z","J","Q","C","D"]  #["FBRZJQCD"]
STACK7 = ["S","B","D","J","M","F","T","R"]  #["SBDJMFTR"]
STACK8 = ["L","H","R","B","T","V","M"]      #["LHRBTVM"]
STACK9 = ["Q","P","D","S","V"]              #["QPDSV"]
STACKS = [STACK1,STACK2,STACK3,STACK4,STACK5,STACK6,STACK7,STACK8,STACK9]

# Example STACKS
# STACK1 = ["Z","N"]          #["ZN"]
# STACK2 = ["M","C","D"]      #["MCD"]
# STACK3 = ["P"]              #["P"]
# STACKS = [STACK1,STACK2,STACK3]
pp("ORIGINAL STACKS",STACKS)

# crates moves : move #n crates from stack number#o to stack number#d
# Method movement: move n elements from stack Origin (stacko) to stack destination (stackd)
# move n from d to e
def smovement(num,stacko,stackd)
    case stacko
    when 1
        stacko=STACK1
    when 2
        stacko=STACK2
    when 3
        stacko=STACK3
    when 4
        stacko=STACK4
    when 5
        stacko=STACK5
    when 6
        stacko=STACK6
    when 7
        stacko=STACK7
    when 8
        stacko=STACK8
    when 9
        stacko=STACK9
    end
       
    case stackd
    when 1
        stackd=STACK1
    when 2
        stackd=STACK2
    when 3
        stackd=STACK3
    when 4
        stackd=STACK4
    when 5
        stackd=STACK5
    when 6
        stackd=STACK6
    when 7
        stackd=STACK7
    when 8
        stackd=STACK8
    when 9
        stackd=STACK9
    end

    stackd.concat(stacko.pop(num).reverse())
end

# Get movements as an ARRAY
stacks_movements.each do |el|
    # num = el.match(/move\s[0-9]*/)
    # stacko = el.match(/from\s[0-9]*/)
    # stackd = el.match(/to\s[0-9]*/)
    # print(el.scan(/\s\d/))
    # print(num,stacko,stackd)
    smovement(el.scan(/\s\d/)[0].to_i,el.scan(/\s\d/)[1].to_i,el.scan(/\s\d/)[2].to_i)
end

pp("FINAL STACKS ",STACKS)

print("FINAL CRATES ON TOP: \n")
i=1
total=""
STACKS.each do |stackarray|
    printf("STACK%d %s\n",i,stackarray.last)
    i += 1
    if stackarray.last
        total.concat(stackarray.last)
    else
        total.concat(" ")
    end
end

print(total)