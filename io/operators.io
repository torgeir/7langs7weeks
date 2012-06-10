OperatorTable

# making plus do minus
4 + = method(n, self - n)
4 + 1 // 3

# adding xor
OperatorTable addOperator("xor", 11)
true xor := method(bool,
  if(bool, false, true)
)
false xor := method(bool,
  if(bool, true, false)
)
true xor false
true xor(true)
