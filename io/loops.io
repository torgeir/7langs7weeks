i := 1
while (i <= 11,
  i print;
  i print;
  i = i + 1;)
"this one goes to 11!" println

# for loop
for (i, 1, 11, i println)

# for loop, increment by 2
for (i, 1, 11, 2, i println)

# for loop, superflous argument
for (i, 1, 2, 1, i println, "extra")
# OUPS, for loop, every argument shifted left
for (i, 1, 2,/* 1,*/ i println, "extra")

if(true, "It is true", "It is false")
if(false) then("It is true") else("It is false")
if(false) then( "It is true" println) else( "It is false" println)
