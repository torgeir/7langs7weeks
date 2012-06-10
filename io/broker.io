Broker := Object clone do(

  forward := method(
    msg := call message 
    printers at(0) doMessage(msg)
  )

  printers := list()

  create := method(
    broker := self clone
    call message arguments foreach(arg, printers append(doMessage(arg)))
    broker
  )

)

Printer := Object clone
Printer create := method(name,
  p := self clone
  p name := name
  p
)
Printer show := method(
  name .. " " .. call message arguments
)

printer := Printer create("one")

broker := Broker create(printer)
broker show(1, 2) println
broker show(3, 4) println

/*while(Scheduler yieldingCoros size > 1, yield);*/

