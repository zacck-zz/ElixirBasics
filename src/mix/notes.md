**Mix**

This is Elixir's very own build tool.
It handles

1. Project Organization.
2. Dependency management.
3. Build Tasks.
4. Custom Tasks.


use `mix new` to start a new project.

Containing
 - ReadMe File
 - mix.exs - defines the the name of your project and the deps
 - test directory
 - lib directory - this is where your code will happen to live.
 - config - We can add project configurations here.

 ```Elixir
 config :project, prefix: "Hello: "
 ```

 To run a mix project in the context of `iex` is the formula `iex -S mix` in the project directory.


To have different configurations for different environments uncomment the line

`import_config "{Mix.env}.exs"`

This lets mix know it should import a file for the environment that it is currently in.

There are 3 mix enviroments

1. test
2. dev
3. prod
