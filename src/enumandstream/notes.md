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

**Stream Module**
