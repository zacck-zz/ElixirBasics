**Loops.**

A loop is a control flow feature that executes repeatedly until some condition is achieved.

`Elixir` doesn't have loops because;
1. Loops require variable mutation.
2. More powerful functional alternatives exist.

**Recursion**

This is a function that calls itself.

*Example*

```Elixir
defmodule MyList do
  #we need to pass a lost to our function.
  def length(list) do
    # at the start a list will only have a count of 0
    length(list, 0)
  end

  #this is a private length function that takes two args the count and a list
  defp length([], count) do
    # empty is list we return the count/ the list is empty because the have counted
    # through all the elements
    count
  end

  #this is the actual counter function
  # here we are using a pattern match to split off the first element from the list.
  # By ignoring it with an underscore the rest of the list is in the tail `t`
  defp length([_|t], count) do
    #this will keep happening until the list `t` is
    # when empty this will trigger our base case above
    length(t, count + 1)
  end
end
```


**Tail Call Optimization**

This is done to prevent stackoverflow  error.

This refers to what a function does as the last thing. If a function calls itself as the last thing Elixir will only put one function on the stacks this happens because function calls are replaced, so there is only on function on the stack at a time.


This only works if the last thing a function does is call itself.


**Recursive Examples**


**MyList.each/2**

```Elixir
defmodule MyList do
  #if we get an empty list lets return an atom ok
  def each([], _fun) do
    :ok
  end

  #this list has a head and a tail
  def each([h|t], fun) do
    # we call the function with the head
    fun.(h)
    # having gotten the last bit of the list we can all ourselves with it
    each(t, fun)
  end
end

end
MyList.each [1, 2, 3], fn(num) ->
  IO.puts to_string(num)
end
```


**MyList.map/2**

```Elixir
list = [
  { "Carla", 27},
  { "Zacck", 27}
]

defmodule MyList do
  def map(list, fun ) do
    #pass a list a function and add an empty accumulator
    do_map(list, fun, [])
  end

  #private do map for edge case
  defp  do_map([], _fun, acc) do
    #return a reversed list as the results will be in the wrong order.
    :lists.reverse(acc)
  end

  #Recursive
  #we call this with valid list and function
  defp do_map([h|t], fun, acc) do
    # call the provided function with each member
    result = fun.(h)
    # tack on the result to the accumulator list
    # Prepending is fast
    acc =  [result | acc ]
    # call ourselves again
    # with the tail, function and result from above
    do_map(t, fun, acc)
  end
end

#map will take a list of things run each through a function then return a list of #results
MyList.map list, fn({name, _age}) ->
  name
end
```
