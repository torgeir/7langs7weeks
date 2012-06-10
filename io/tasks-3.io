# Enhance the XML program to add spaces to show the indentation structure.  # and # Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example: book({"author": "Tate"}...) would print <book author="Tate">: 

Builder := Object clone do(

  forward := method(

    tag   := call message name 
    args  := call message arguments

    if(args size == 0,
      writeln(indent, "<#{tag}/>" interpolate)
      return
    )

    writeln(indent, "<#{tag}#{attributes(args)}>" interpolate);

    args foreach(arg,
      indented(
        content := self doMessage(arg)
        if(content type == "Sequence", writeln(indent, content))
      )
    )

    writeln(indent, "</#{tag}>" interpolate)
  )

  indented := method(
    if(call message arguments size > 0,
      indentation = indentation + 1
      call evalArgs
      indentation = indentation - 1
    )
  )

  indentation := 0

  indent := method(
    spaces := "" asMutable
    indentation repeat(spaces appendSeq("  "))
    spaces
  )

  attributes := method(args,
    attrs := ""
    if(args size > 0 and args first name == "curlyBrackets",
      attrs = doMessage(args removeFirst)
    )
    attrs
  )

  OperatorTable addAssignOperator(":", "asHtmlAttributes")

  curlyBrackets := method(
    call message arguments map(arg,
      self doString(arg asString)
    ) join()
  )

  asHtmlAttributes := method(key, value,
    key := key asMutable removePrefix("\"") removeSuffix("\"")
    " #{key}='#{value}'" interpolate
  )
)

Builder html(
  head(
    title("Io dsls rock!")
  ),
  body(
    ul(curlyBrackets( "id": "languages", "class": "fancy" ),
      3 repeat(
        li("Io", br)
      ),
      li({ "id": "lua" },
        p("JavaScript")
      )
    )
  )
)

# Create a list syntax that uses brackets.
squareBrackets := method( call message arguments )
[1, 2, 3] println
