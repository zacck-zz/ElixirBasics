**Enum and Stream**

**Enum Module**
This module contains a number of functions that work with enumerables.
A type is considered an enumerable if it implements the enumerable protocol

most of the functions in this module contain this signature.

`Enum.function(Enumerable, fun)`

What happens is the function will take an enumerable and a function to apply on each of it's children.
The result of which is then returned from calling the module.

*Enumerable Types*
- Lists
- Keyword Lists
- Maps (not Structs)
- Ranges
- Streams


**Enum.at/2**

```Elixir
Enum.at([1, 2, 3], 1, :default])
#  => 2

Enum.at(%{name: "Daniel"}, 0, :default)
# =>  {:name, "Daniel"}
```

This function will return the element at the provided index.

When  you do this with a `map` you don't get a map back instead you get a tuple where the key is first and the value second.

When used as an enumerable maps act as a list of of tuples where the key is the first element and the value second.


**Enum.filter/2**

This function will filter an enumerable down to only those elements that pass the filter.

```Elixir
Enum.filter ["string", 2, {}, %{}], fn(val) ->
  is_number(val)
end
# =>  2

Enum.filter %{name: "Daniel", dob: 1991}, fn({_key, val}) ->
  is_binary(val)
end
# => [name: "Daniel"]
```

**Enum.reduce/2**

This reduces /compiles an enumerable down to a single value.

```Elixir
Enum.reduce [1, 2, 3], 0, fn(num, sum) ->
  sum + num
end
# => 6
```

Here you see the reduce function uses an accumulator to compute the sum of the list.

We pass in the list of the numbers then the initial value of return or a default return value, The function to compute our reduction.


```Elixir
Enum.reduce ["episodes", "07-enum-and-stream"], "", fn(segment, path) ->
  path <> "/" <> segment
end
#this returns
# => "/episodes"
# => "/episodes/07-enum-and-stream"
```

Here we are reducing the segments and paths into a url formatted one.

- First we pass in an empty string as the initial/default segment.
- Second the initial segment is joined on the first path.
- This is repeated as we walk down the list of strings.

Reduce compares to cooking where one make solution out of multiple inputs.

**Enum.into/2**

This will convert an enumerable to another type. Target must however implement the `Collectable` protocol.

```Elixir
%{name: "Daniel", dob: 1991}
|> Enum.filter(fn({_k, v}) ->  is_binary(v) end)
|> Enum.into(%{})

# => %{name: "Daniel"}
```


**Enum.take/2**

This takes a number of elements from the top of an enumerable and returns those.

```Elixir
Enum.take(1..10, 5) # here you see we pass a range and request the first 5 elements
# => [1, 2, 3, 4, 5]
```



**Capture Operator**

 This captures or creates an anonymous function.

 ```Elixir
Enum.filter [1, 2, 3], fn(val) ->
  is_number(val)
end

#the above would be done like

Enum.filter ([1, 2, 3], &is_number/1)
#Here we invoke the function using the `&` sign
# this lets Elixir know that we want to make what follows an anonymous function.
# then we just use the is_number function directly
# then the number of parameters our function takes this is because you may have another polymorphic copy of the function elsewhere
 ```

 We can also specify to our capture Operator to pick only the first argument passed to it.

 `Enum.filter ([1, 2, 3], &is_number(&1))`

 Here we are telling our function to use only the first argument passed to it.

 We can write the reduce function like this

 `Enum.reduce([1, 2, 3], &(&1 + &2))`

Here we are using `&` to make an anonymous function the using the Operator to cherry pick the first and second argument provided to our anonymous function.

We can also capture operators since they are functions too.

`Enum.reduce([1, 2, 3], &+/2)`

You can capture functions from other modules

`Enum.map(["Daniel", "Joe"], &String.upcase/1)`
`# => ["DANIEL", "JOE"]`


**Stream Module**

This is a lazy version of the Enum  module. It has a lot of the same functions but it doesnt do any work until it has to. And even then it only does what it has to do.

```Elixir
[1, 2, 3, "string"]
|> Stream.filter(&is_number/1)
|> Stream.map(&(&1 * 2))

# => %Stream{enum: [1,2,3, "string"]. funcs: [ ...]}
```

This will return a stream struct

```Elixir
%Stream{
  enum: [1, 2, 3, "string"] #enum attrib is used to store the enumerable we want to operate on
  funs: [ # list of anon functions to run on that enumerable

  ]
}
```

This means a `Stream` can be built upon.

We get a Stream to do its work by asking it for its results. e.g

```Elixir
stream = Stream.filter(list, &is_number/1)
stream = Stream.filter(stream, &(&1 * 2 == 4))
Enum.into(stream, [])
```

Here we are doing so by asking enum.into to convert a stream into a list.

Another option is using the  `stream.run`

```Elixir
[1, 2, 3]
|> Stream.each(fn(n) -> IO.puts(n) end)
|> Stream.run
```

You would typically use this when you don't need to bind the results into a varianle.

Stream can be more efficient than enum.

**Stream.cycle/1**

Creates an infinite stream of repeating elements.

```Elixir
Stream.cycle(["Spring", "Summer", "Autumn", "Winter"])
|> Enum.take(8)
# =>  [ "Spring", "Summer", "Autumn", "Winter", "Spring", "Summer", "Autumn", "Winter"]
```

**Stream.iterate/2**
This can be used to create an infinite stream with a function

```Elixir
Stream.iterate(2, &(&1 * 2))
|> Enum.take(3)
# => [2, 4, 8]
```

Here we define a starting value and a function run on the previous value. 

**Stream.resource/3**

This can be used to convert anything into a stream.

`Stream.resource(start_fun, next_fun, after_fun)`
