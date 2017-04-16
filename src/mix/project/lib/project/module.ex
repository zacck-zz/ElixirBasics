defmodule Project.Module do
  #we can use a module attribute to read from the env
  @prefix Application.get_env(:project, :prefix)
  def my_do(text) do
    @prefix <> String.reverse(text)
  end
end
