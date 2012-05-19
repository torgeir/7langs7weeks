# 1
    puts "Hello, world"

# 2
    hello = "Hello, Ruby"
    puts "For the string #{hello}. the index of Ruby is #{hello.index 'Ruby'}"

# 3
    puts "Torgeir\n" * 10

# 4
    (1..10).each { |num| puts "This is sentence number #{num}\n" }

# Bonus
    def guess
      stripNewline gets
    end

    def stripNewline (str)
      str.gsub("\n", "")
    end

    number = rand(10).to_i
    puts "Guess the number!" 
    puts "Wrong answer!" until (answer = guess.to_i) == number
    puts "Correct, the number was #{number}."
