**Comprehensions**

These is the last of Elixir's answers to the lack of loops.

They are powered by Elixir's `for` macro. That is comprised majorly of the following parts;


- Generators
- Filters
- :into

The `for` macro combines features of map, filter and into.

```Elixir
for element <- Enumerable do
  element
end
# this will return a list
```

This means you can almost always use the `for` macro instead of the macros mentioned.


**Generators**

A Generator is used to specify what we want to run the `for` macro over.

`element <- Enumerable`

You can use this with ranges, lists, and maps.

*A generator behaves like a map*

```Elixir
for name <- ["Zacck", "Terri"] do
  String.upcase(name)
end
# => ["ZACCK", "TERRI"]
```

We can see here this is almost the same as the syntax for the `map` macro.

*By Default the for macro will always return a list*

We can use multiple generators to create complex lists.


Consider this example that generates a deckof playing cards.



```Elixir
for suit <- [:hearts, :diamonds, :clubs, :spades],
    face <- [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] do
      {suit, face}
end  
```

Here we see that for each `suit` we will generate a `face` of each kind for the suit and move to the next.

We can use Generators to perform filtering by the patter match operator

```Elixir
for{:spades, face}  <- do
  {:spades, face}
end
```

Here we are using pattern match to only return the faces that are of the suit `:spades`.


**For Filters**

The `for` macro allows for more powerful filtering using filter expressions  after generators.

Consider

```Elixir
for element <- Enumerable, filter do
  element
end
```

Here we can see we are running elements through the filter before returning the final list of elements from our generator.

Consider our expression above to find cards in the spades suit we can further filter down to the string cards i.e not numbered

```Elixir
for {:spades, face} <- deck, is_binary(face) do
  {:spades, face}
end

# => [{:spades, :jack}, {:spades, :ace}, {:spades, :king}, {:spades, :queen}]
```


Like generators you can have multiple filters

```Elixir
for {suit, face} <- deck,
    suit == :spades,
    is_number(face),
    face > 4 do
      {suit, face}
end
```

Here we are returning only the numbered `:spades` that are greater than the `4` of `:spades`.

 **:into**

 This option can be used to make the `for` macro to return something else other than a list.

```Elixir
for {key, val} <- %{name: "Zacck", dob: 1990, email:"zacck@zacck.zacck"},
key in[:name, :email],
into: %{} do
  {key, val}
end
```

This will return

` %{name: "Zacck", email:"zacck@zacck.zacck"}`

As you can see here we are using the into option to return a collectable.


collectables are types that implement the Collectable protocol. They include;

- Map.
- List.
- IO.Stream.
- Bitstring (Binary)



**Binary Comprehensions**

The `for` macro can also be used to iterate through binaries.

All variable names used in for are local.

**Enum VS Stream VS for**


- Enum is neither lazy nor efficient.
- The for macro does not support the capture operator.

**Tips**
1. One operation: Enum or for
2. Multiple operations for or Stream
3. Generating a list: for or a Stream generator
4. Multiple lists: for.
