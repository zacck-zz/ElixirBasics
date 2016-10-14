#a loop is a control flow feature that will
#execute repeatedly until a certain condition is met

#recursion is when a functin calls itself
defmodule MyList do
  #define a length statement that takes in a list and returns the length of the list
  def length(list) do
    #implelement here
    #initial length
    length(list, 0)
  end


  #private functin that takes in a list and a count variable this will return 0 if the passed in list is empty
  #this is will be called if the list is empty
  defp length([], count) do
    count
  end

  defp length([_|t], count) do
    #call in this same function but with the first element in the list popped
    length(t, count + 1)
  end

end


#Each
#the each function takes a list of elements and runs a function on each of its elements
MyList.each[1,2,3], fn(num) ->
  IO.puts to_string(num)
end


defmodule MyList do
  #EACH returns the atom :ok in the final call
  #if empty list is passed in
  def each([], _fun) do
    :ok
  end

  #if list passed in is not empty
  def each ([h|t], fun) do   #pop off the first element
    fun.(h)
    #recursively call each with the tail of the function
    each(t, fun) #tail call optimization
  end

  #MAP Returns a list of the results
  # map will take a list of things run each element through a function and return a new list
  # with the results of elements as acted uponn by the function


  list =[
    {"Daniel", 24},
    {"Ash", 32},
    {"Zacck", 26}
  ]
  MyList.map list, fn({name, _age}) ->
    name
  end

  #map implementation
  #this takes in a list and a function and delegates all the work to a private do_map function
  def map(list, fun) do
    #takes in a list, function and an empty list that acts as an accumulator
    do_map(list, fun, [])
  end

  #in case list is empty reverse and return the list as it will be in the wrong order
  #since this will be called last anyway after the map the reverse part still applies
  defp do_map([], fun, acc) do
    :lists.reverse(acc)
  end

  #when list is not empty
  #pop the first element offf
  defp do_map([h|t], fun, acc) do
    #run first element through function and return result
    result = fun.(h)
    #then prepend the result of the function to the accumulator list
    #this is why we have to reverse the order of the list in the base case
    acc = [result| acc]
    #at this point it will call itself on the remainder of the list
    do_map(t, fun, acc)
  end

end
