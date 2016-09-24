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

#LISTS
#these are variable length collections
[value, value]

#EXamples
ages = [42, 31,24]
names = ["Ash", "Leslie", "Dori"]

Enum.at(names, 0) # => "Ash"

"""
-elixir lists are head/tail pairs
-Immutability makes them memory efficient
-Prepending is FAST
-Appending is SLOW
-Inserting elements can be slow
-Reading the whole list can be slow

"""

#CHARACTER LISTS
[integer, integer]

#examples
'hello'

#is really
[104, 101, 108, 108, 111]


#FUNCTIONS
fn(args) -> ... end

#Examples
add = fn(a, b) ->
        a + b
      end

add.(1,2) #  =>3  
