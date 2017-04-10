**Functiins, Modules and Structs**


**Named Functions**

 To define a named function we would follow the example below

 ```Elixir
 def add(a, b) do
    a + b
 end
 ```

Here we use the macro `def` the result of the last expression in the function is the value returned by the function.

Named functions have to be placed in `modules`

**Modules**

We define a module as follows

```Elixir
defmodule Math do
  def add(a, b) do
    a + b
  end
end
```

We use the macro `defmodule` to define a module. Modules can be thought of as buckets with related functions.

 *Calling Named Functions.*

 `Math.add(1, 2)`

 You call a named function by using it as a method of the module that contains it.
 If functions are in the same module you don't need to use the name of the module


 *Modules can be nested*

 ```Elixir
 defmodule Math do
  defmodule Division do
    def divide(a, b) do
      a / b
    end
  end
 end

 Math.Division.divide(15, 5)
 ```

 Here we see we have nested `Division` module in the `Math` module and we first call the Division module as a function of the math module and the divide function as a method of the Divide module.

 **Private Functions**

 These can be defined using the `defp` macro they cannot be called from outside the module.

```Elixir
defmodule Number do
  def format(number) do
    format = config[:format]
  end
  defp config do
    # get config here
  end
end
```

If you call `Number.config` will throw an undefined error.


**Aliasing**

We use `Aliasing` as a way of using functions that are defined in another module.

```Elixir
defmodule MyModule do
  def my_function(args) do
    Really.Long.OtherModule.other_function
  end
end
```

We can shorten the above syntax using the `alias` macro.

```Elixir
defmodule MyModule do
  + alias Really.Long.OtherModule

  def my_function(args) do
    OtherModule.other_function
  end
end
```

Here we can Import the other module and just call the function with the last part of the name.

Alternatively we can use the `as` macro to change the name of the other module as you `import` it of sorts consider the following.

```Elixir
defmodule MyModule do
  alias Really.Long.OtherModule, as:0

  def my_function(args) do
    0.other_function
  end
end
```


Here we see we change the name as we import the module and then proceed using the module with it's new name.


**Importing**
 We can also import modules and use them.

 ```Elixir
 defmodule MyModule do  
    import Really.Long.OtherModule

    def my_function(args) do
      other_function
    end
 end
 ```
