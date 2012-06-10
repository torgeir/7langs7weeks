4 < 5
true and false

true and 0 # obs

true proto
true clone
false clone
nil clone

# singleton
Highlander := Object clone
Highlander clone := Highlander

mike := Highlander clone
fred := Highlander clone
mike == fred # true, singleton

one := Object clone
two := Object clone
one == two # false

# Object clone := "hosed"
# o := Object clone
# o
