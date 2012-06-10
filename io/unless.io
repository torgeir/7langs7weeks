# send a message to the sender
pinger := Object clone
pinger ping := method(call sender pingback)
pingback := method("got ping")
pinger ping

# eval
echo := method(
  arg := call message argAt(0);
  call sender doMessage(arg)
)
echo(1 + 1)

# the books unless
unless := method(
  (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

unless(false, writeln("was false"), writeln("was true"))
unless(true, writeln("was false"), writeln("was true"))

# a readable unless
unless := method(
  arg0 := call message argAt(0);
  arg1 := call message argAt(1);
  arg2 := call message argAt(2);
  writeln(" arg 0 is: " .. arg0);
  writeln(" arg 1 is: " .. arg1);
  writeln(" arg 2 is: " .. arg2);
  self doMessage(arg0) ifFalse(
      call sender doMessage(arg1)
    ) ifTrue(
      writeln(" first arg evaluated was true!");
      writeln(" now evaluating: " .. arg2);
      result := call sender doMessage(arg2);
      result
    )
)

unless(true,  writeln("was not true"), writeln("was true"))
unless(false, writeln("was not true"), writeln("was true"))

# The Princess Bride
Person := Object clone
Person unless := getSlot("unless")

westley := Person clone
princessButtercup := Person clone

princessButtercup trueLove := true
westley sendTheMessage := method(
  princessButtercup unless(trueLove, /* 
                                    // call sender => call westley
                                    // doMessage(
                                    //   call message argAt(0)
                                    // ) => trueLove
                                    // => westley trueLove
                                    */
                           ("it is false" println),
                           ("it is true" println))
)
westley sendTheMessage

# call sender doMessgage(msg)
# => evaluate msg in context of the receiver 
