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
  defp length([], count) do
    count
  end

  defp length([_|t], count) do
    length(t, count + 1)
  end

end


#Each
#the each function takes a list of elements and runs a function on each of its elements
MyList.each[1,2,3], fn(num) ->
  IO.puts to_string(num)
end


defmodule MyList do
  #if empty list is passed in
  def each([], _fun) do
    :ok
  end

  #if list passed in is not empty
  def each ([h|t], fun) do
    fun.(h)
    each(t, fun) #tail call optimization
  end

  #MAP
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
  def map(list, fun) do
    do_map(list, fun, [])
  end

  defp do_map([], fun, acc) do
    :lists.reverse(acc)
  end

  defp do_map([h|t], fun, acc) do
    result = fun.(h)
    acc = [result| acc]
    do_map(t, fun, acc)
  end

end
