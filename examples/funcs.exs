"""
define anonymous function
"""
add = fn(a, b) ->
  a + b
end

hello = add
hello.(1, 2) #=> 3

"""
named functions
named functions have to placed inside a module TODO study modules
the result of the last expression in the function will be returned
named functions are called from the module they are defined in.
Modules are an organization tool for related functions
Math.add

Modules can be nested and functions

private function
"""
defmodule Math do
  #importing function
  import Modulename,
    only:[other_function: 1] #name of the function and number of params
  #aliasing
  alias Really.Long.OtherModule, as: O
  def add(a,n) do
    a + b
  end
  #this is a private function
  defp config do
    #do code here
  end

  #function used in another module
  #this is called aliasing
  def my_functin(args) do
    0.other_function
  end
end
