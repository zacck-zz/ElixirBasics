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


**How to Write Your Our mix task**

1. Make a new folder in the lib directory called `mix`
2. Make a new folder in here called `tasks`
3. Then make a new module here


Use the `--umbrella` flag to create a project that is big and compasses different functionalities.

The `apps` folder is a reference to the fact that each mix project is n OTP application.
