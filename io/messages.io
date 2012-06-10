postOffice := Object clone

# calls sender of the message
postOffice packageSender := method(call sender)
postOffice packageSender

mailer := Object clone
mailer deliver := method(postOffice packageSender)

# mailer sends packageSender to postOffice
mailer deliver 

postOffice messageTarget := method(call target)

# postOffice iss the target of the message messageTarget
postOffice messageTarget

postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)

postOffice messageArgs("one", 2, 3)
postOffice messageName

