**ExUnit**

This is Elixir's testing framework.

- Tests are code that verifies that your project code is working correctly.
- `ExUnit` is the main tool used in testing.

Starting ExUnit.

- Since ExUnit needs to run and manage multiple beam files to test your project you need to start it before you run your rests and you can do this by running.

`ExUnit.start`

this will run the

`tests/test_helper.exs`



**ExUnit Test Anatomy**

A test is just a standard module. Consider the following

```Elixir
defmodule MyApp.MathTest do
  use ExUnit.Case

  test ".add sums two numbers" do
    assert Math.add(1, 2) == 3
  end
end
```

Here we see a module defined and that imports ExUnit.Case

- Assertions are how you verify the code you are testing works the way you expect it to. These are written using the `assert` macro followed by the expression you would like to be truthy e.g `assert 5 > 3`.

- You can override assertion error messages with string to make your tests clearer. e.g

`assert customer !=nil,  "Customer was not created in the database"`

`refute`

This is the mirror opposite of assert this expects the expression to return a falsey value.

You can write custom assertions made up by combining smaller/simpler assertions. This can help with avoiding  code repetition.

To share data between tests you can have a `setput` function that returns a tuple with the atom `:ok` and the key word list of the variables. The keyword list in the setup block becomes a map when in your testing block.


You can share more code between tests is by using the ExUnit function called `CaseTemplate`.

You can run tests asynchronously as long as they dont share data the `async: true` option when importing ExUnit.

Elixir allows you to tag tests using the `moduletag` and tag attributes.

You can exclude some tagged tests from running using

```Elixir
ExUnit.start
ExUnit.configure exclude: [:slow]
```

Exunit also provides a `:skip` tag that lets you skip a test and optionally provide a reason as to why you are skipping a test.


You can write pending tests using the `@tag :not_implemented`
This can be useful when just listing features.

**Doctests**


This is Elixir's answer to keeping your inline documentation up to date.

```Elixir
defmodule MyApp.Math do
  @doc"""
  Adds two numbers together and returns the sum.

  ## Examples

  iex> Math.add(1, 3)
  4

  iex sum = Math.add(4, 4)
  ...> Math.add(sum, 5)
  15
  """
  def add(a, b) do a + b
end
```

here we see an inline documentation for a function using the syntax

```Elixir
  iex>  function
  result
```

You can have multiple tests using `iex>` to start new test sections.

 To get doctests to run use

```Elixir
defmodule MyApp.MathTest do
  use ExUnit.Case

  doctest MyApp.Math
end
```

The above would run the code tests described in the code block at the top.


Doctests help with reliability to documentation

When you update the code to doctest .

When ever possible write you tests as documentation tests as this will enable you to have your logic and code at the same place.

Use tests when there is some set up involved.

**Running Your Tests**

Use `mix test`

use tags to include tagged tests

1. Write tests on every public function.
2. If you don't what to test a function make it private or set `@doc false`.
3. Prefer doctests to regular tests.
