defmodule Parallel do
  #a Parallel map function to show case processes
  def pmap(collection, fun) do
    collection #lets start of with a collection to run huge computation on
    |> Enum.map(&spawn_process(&1, self(), fun)) #make a process for each item in the collection
    |> Enum.map(&await/1) #wait for processes to complete and send use messages
  end

  #this spawns a process that tajes in the item, the pid of the parent and the function to run on the item
  defp spawn_process(item, parent, fun) do
    # then we spawn a process that sends the parent  our process Id and the result
    spawn_link fn ->
      send parent, {self(), fun.(item)}
    end
  end

  # the await function recieves the message
  defp await(pid) do
    receive do
      {^pid, result} ->  result
    end
  end
end
