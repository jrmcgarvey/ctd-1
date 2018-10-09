# answer each of the following to the best of your ability
# there is always more than one way to code a response 😄
# please use your knowledge of variable assignments in each response
# when you are done, share your code with your instructor, push it to Github, or submit a pull request

# variables
x = 27 # integer
name = "Kristine" # string
y = 27.0 # float

# expressions - using variable assignments to make equations
x = 20
y = 7
x + y


# concatenation
name = "Kristine"
"Hello my name is " + name

# string interpolation
name = "Kristine"
print "What is your name? "
name = gets.chomp
puts "Hello #{name}!"

# loops
command = ''
while command != 'bye'
  puts command
  command = gets.chomp
end
puts 'Come again soon!'


# arrays
[]
array = Array.new
names = ['Kristine', 'Rene', 'Shu', 'Alik', 'Victor', 'John']

names << 'Gracias'
names.push 'Jennifer'
