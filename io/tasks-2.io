# Fibonacci with recursion
rec_fib := method(n,
  if (n < 2,
    n,
    rec_fib(n - 1) + rec_fib(n - 2))
)

# Fibonacci with loop
loop_fib := method(n,
  if (n == 1, return 1)
  previous := 0
  current := 1
  number := 0
  for(i, 2, n,
    number = previous + current
    previous = current
    current = number)
  number
)

for(i, 0, 10, (rec_fib(i)  .. " ") print) println
for(i, 0, 10, (loop_fib(i) .. " ") print) println

# How would you change / to return 0 if the denominator is zero?
Number / := method(denominator,
  if(denominator == 0, return 0)
  denominator ** (-1) * self
)
(10 / 0) println
(10 / 2) println

# Write a program to add up all of the numbers in a two-dimensional array.
List deepSum := method(
  map(lst, lst sum) sum
)
write("deepsum: ") list(list(1, 2), list(3, 4)) deepSum println

# Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)
List myAverage := method(
  if (size == 0, 0, sum / size))
write("myAverage: ") list(1, 2) myAverage println
write("myAverage: ") list() myAverage println

# Write a prototype for a two-dimensional list.
# The dim(x, y) method should allocate a list of y lists that are x elements long.
Matrix := List clone
Matrix dim := method(lists, size,
  lists repeat(append(list() setSize(size)))
)

# set(x, y, value) should set a value
Matrix set := method(x, y, value,
  at(x) atPut(y, value)
  self
)

# and get(x, y) should return that value.
Matrix get := method(x, y, at(x) at(y))

l := Matrix clone dim(3, 3) set(1, 2, 1000) set(2, 1, 5000)
l get(1, 2)
l get(2, 1)

Matrix format := method(
  map(list, list join(" ")) join("\n")
)

# Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list
Matrix transpose := method(
  transposed := Matrix clone dim (size, at(0) size)
  foreach (i, lst,
    lst foreach(j, item,
      transposed set (i, j, get(j, i))
    )
  )
)

l format println
l transpose format println

# Write the matrix to a file
Matrix toFile := method(filename,
  File with(filename) remove openForUpdating write(format) close
)
l toFile("matrix.txt")

# and read a matrix from a file
Matrix fromFile := method(filename,
  self = Matrix clone
  f := File with(filename) openForReading
  f foreachLine(line, self append(line split(" ")))
  f close
  self
)
l fromFile("matrix.txt")

# Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.
number := Random value(100) round
10 repeat(
  guess := File standardInput readLine("guess the number (0-100): ") asNumber
  if (guess == number, "u win the prize!" println; return)
  if (guess < number,  "u too low"  println,
                       "u too high" println)
)
"u loose" println
