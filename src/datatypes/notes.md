Elixir Data Types.
- Base Types: these are types that are inherited from Erlang.
- High Level Types: Constructs formed from base Types.

**Numbers**

1. Integers - no decimals e.g 3
2. Floats - decimals e.g 5.6

**Atoms**

These are named constants
:named_constants
:"This is an Atom with Spaces"

**Binaries**
These are the binary digits of the information.

Strings are just binaries in Elixir.
Strings can be written in multiple lines using the tripple quote syntax

```elm
"""
hey there
whats up
"""
```


**Maps**

These are key value stores

` map = %{key: value}`

You can access the values by one of the following methods

`map.key`
`map[:key]``


**Tuples**
This is a collection of items, They are usually used to hold a fixed number of items

`me = {"Zacck", 27}`

We can access elements

`elem(me, 0)`
we can put elements

`put_elem(me, 1, 34)`

**List**
This is a variable length collections.
They are implemented as immutable head tail pair.

Pros.
Fast to prepend
`list1 = [1,3,4]`
`list2 = [0 | list1 ]` -- Prepend 0 to the list.

Cons.
Appending is slow.
Inserting an element into the middle of the list can be slow.
Reading the whole list can be slow.

**Character List**

`'hello'`


**Functions**

These are first class data types in Elixir and can be passed around

`fn(args) -> end`

```Elixir
add = fn(a,b) ->
        a + b
      end

add.(1,2) # => 3  
```

How to check type

`is_type(value)`

**High Level Types**

Constructs

**Keyword Lists**

These are lists of a special kind in these each element is a tuple with two element.

**Structs**

These are maps of special kind. These are maps that have struct key.

`%{__struct__: ModuleName, ...}`


```Elixir
%Post{
  title: "Anatomy of An Elm Application",
  author: "Zacck Osiemo"
}
```

**Range**

Collection of numbers.

**Regular Expressions**
