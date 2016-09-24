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
 
