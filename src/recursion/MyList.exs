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
