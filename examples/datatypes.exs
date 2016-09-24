#BASE TYPES - inherited from Erlang
#HIGH LEVEL TYPES - constructs of the base types

#Numbers
#Integer, no decimals
42
1_000_000

#Floating point number, decimals
42.03

#numbers can be split up with underscores for read ability

#Atoms are named constants i.e name starts with a full colon

:named_constant

#how to write atoms
:this_is_an_atom

:"an atom with spaces"

#true and false are atoms

true == :true
false == :false

#Module names are atoms
GenServer.start_link
GenServer == :GenServer

#Nil is an atom
nil == :nil


#BINARIES
<<byte, byte ,byte >>

01101000 01100101 01101100 01101100 01101111

#is represeented in ELixir as this Binary:
<<104, 101, 108, 108, 111>>

#which can also be written this way:
"hello"

#STRINGS
#this are just binaries in elixir
"Hello, World!"

"""
This is a multiline string.
These are used in documentation.
"""

#MAPS
#these are a key value store

#example
episode =  %{
  name: "Data types",
  student: "Zacck Osiemo"
}


episode.name # => Data types
episode[:student] # => "Zacck Osiemo"


#TUPLES
#these are collections of items
{value, value}

#examples
me = {"Zacck", 26}

#How to acces elements in a tuple
elem(me, 0) # => Zacck

#updating element in a tuple
put_elem(me, 1, 25) # => {"Zacck", 25}  tuple, element, value
