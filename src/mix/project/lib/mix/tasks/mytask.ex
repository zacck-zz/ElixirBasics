defmodule Mix.Tasks.Talk do
  @shortdoc "Encrypts some text"
  use Mix.Task

  def run(args) do
    {opts, _, _} = OptionParser.parse(args, aliases: [t: :text])
    IO.puts Project.Module.my_do(opts[:text])
  end
end
