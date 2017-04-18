defmodule Project.Module do
  #we can use a module attribute to read from the env
  @prefix Application.get_env(:project,  __MODULE__)[:prefix]
  # here we can read from the config object using our current module name.
  
  def my_do(text) do
    @prefix <> String.reverse(text)
  end
end
