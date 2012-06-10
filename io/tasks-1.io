# Evaluate 1 + 1 and then 1 + "one".
# Is Io strongly typed or weakly typed?
    1 + 1
    try(1 + "one") error println
    // Io is strongly typed, as you get errors when types collide

# Is 0 true or false?
    if(0 and true, "0 equals true!") println // true

# What about the empty string?
    if("" and true, "\"\" equals true!") println // true

# Is nil true or false?
    if(nil == nil, "nil equals nil!") println
    if(nil == true, "nil is true", "nil is not true!") println
    if(nil == false, "nil is false", "nil is not false!") println
    // nil is a singleton, neiter true nor false

# How can you tell what slots a prototype supports?
    Object slotNames

# What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)?
    // :=  Creates slot, assigns value
    //  =  Assigns value to slot if it exists, otherwise raises exception
    // :=  Creates slot, creates setter, assigns value
    o := Object clone
    o age ::= 1000
    o println
    // ==>  Object_0x1002a5400:
    //   age              = 1000
    //   setAge           = method(...)

# Run an Io program from a file.
    // io tasks-1.io
    // doFile("tasks-1.io")

# Execute the code in a slot given its name.
    Person := Object clone
    Person age ::= 0 // creates setter
    torgeir := Person clone
    torgeir setAge(28)
    torgeir println

