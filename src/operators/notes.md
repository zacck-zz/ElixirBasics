**Operators**
These can be seen as a different form of function with a different calling notation and a limited number of parameters.
--Wikipedia

left <func> right


**Match Operator**
`=`

These tries to match the pattern on the left side with the pattern on the right.

`name = "Daniel"`

If the pattern on the left is a variable name. The value on the right is bound to the variable name.

Variable Names can be rebound

```Elixir
name = "Zacck"
name = "Osiemo"

name # => "Osiemo"
```

Complex, multi-part patterns can be used.


`{name, age} =  {"Zacck", 27}`

use _ to ignore elements in matches

`{name, _ } = {"Zacck", 27}`

`_age` is still ignored since it starts with an underscore.

Match pattern can be used for assertions since it will raise an error.

You can use variables in matches.

```Elixir
name = "Zacck"
{^name, age} = {"Zacck", 27}

age # => 24
```

Every type can be matched against.


**Math Operators**

```Elixir
1 + 1
5 - 2
15 / 3
3 * 5   

rem(12, 1) -- this is the modulus function.
```

**Comparison Operators**

These check for comparing equality. Unlike the match operators these wont raise an error if the assertions fail.

```"Zacck" == "Zacck" #=> true
1 == 1.0 # => true
1  === 1.0 # => false

! is the not

2 > 1

2 >= 2
```

**List Operators**


**in**

Assert that an element is present in a list.

`"Zacck" in ["Carla", "Zacck", "Roger"]  # => false`

**++**

This is useful for appending elemnents to the end of the list

`[1,2,3] ++ [4,5] # => [1,2,3,4,5]  `

take great care when manipulating lists this way due to perfomance.

**--**

Removes shared members between 2 lists.

`[1,2,3] -- [1,3] # => [2]`

**|**

This is the pipe operator this can be used to prepend an element to a list.
this can also be combined with `=` for complex matches.

```Elixir
[head | tail] = [1, 2, 3]

head # => 1
tail # =>  [2,3]
```

**Binary Operator**

`<>`

You can concatenate two binaries with <>.
`N/B` Strings are binaries :).

`"Hello " <> "World" # => Hello World`

Append variables to binaries using the string interpolation syntax

`#{}`

```Elixir
"The value of one plus two is : #{1 + 2}"
```

`=~`

Compare a binary to a regular expression using this operator.

`"Goodbye" =~ ~r/Good/ # => true`

**Bitwise Operators**

**Logical Operators**

`&&` / `and`

Asserts that two expressions are truthy, Both return something other than `nil` or `false`.

`1==1 && 2 == 3 # => false`


`||` / `or`

Returns the first expression that isn't `0` or nil


**Pipeline Operator**

This operator is used to chain functions together into a pipeline hence it's name


```Elixir
var = foo(var)
var = bar(var)

# the above can be expressed in another way.

var = var
      |> foo
      |> bar
#  this translates to

var = bar(foo(var))
```
