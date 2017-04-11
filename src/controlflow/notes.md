**What is control flow?**

Almost every program needs to behave differently depending on the situation. The features which allow it to do this are called "Control Flow" features.


**cond**

This macro will run the first block of code where the expression is truthy.

```Elixir
cond do
  expr ->  code
  true -> default
end
```

In case none  of them is true you should always include a true default.

```Elixir
cond do
  1 + 1  == 1 ->
    "This will never happen"
  2 * 2 != 4 ->
    "Nor  this"
  true ->
    "This will"
end
```


**case**

This macro can be used to run a specific block of code depending on the value of an expression.

```Elixir

case expr do
  output -> code
  _other -> default
end
```


example

```Elixir
case Stripe.Customer.create(attrs) do
  {:ok, customer} ->
    "A customer was creared with the ID #{customer.id}"
  {:error, reason} ->
    "Customer could not be created because #{reason}"
  other ->
    "An unknown error occured. #{other}"
end
```

Here we try to create a Stripe customer, the create function can return an ok tuple or an error tuple we can use the case statement to check the responses of the function and act accordingly. i.e run the code associated with the first pattern that matches.

**if**

This is the familiar if statement

```Elixir
if expr do
  code
end
```

This will run the code in the do block if the expression returns a truthy value. These statements can have an else block.

```Elixir
if 1 + 1 == 3 do
  "This wont happen"
else
  "This will happen"
end
```

The code in the else clause will run if the result of the expression is falsey.
Consider the following example.

```Elixir
if user.admin? do
  #display admin interface
else
  # display normal ui
end
```

**unless**

Like ruby this macro will run the code in the do block unless the expression is true. Consider the following.

```Elixir
unless 1 + 1 == 3 do
  "The laws of math still hold true"
end
```

**Pattern Matching**

This is one of `Elixir's` most powerful features.

Consider the following

```Elixir
def blank? (value) do
  # determine if value is nil , false or " "
end
```

Here we can use pattern matching as follows

```Elixir
def blank?(nil),    do: true
def blank?(false),  do: true
def blank?(""),     do: true
def blank?(_other), do: true
```

Here we see different bits of code being run depending on the parameter passed to the `blank` function.


**Guards**

These are used in function definitions to `guard` a function from being run if the parameter given do not meet a certain condition guards start with the `when` macro.

```Elixir
def my_function(arg) when expr do
  # ...
end
```

consider our pattern matching function `blank` combined with guards we can clean up the function as follows

```Elixir
def blank?(value) when value in [nil, false, ""], do: true
def blank?(_other), do: false
```

*Only certain kinds of expressions can be used with guards*

*Case statements can also use guards*


```Elixir
case response do
  {:ok, body} ->
    "Success"
  {:error, status_code, body} when status_code in 400 .. 499 ->
    "400 fail error"
  {:error, status_code, body} when status_code in 500 .. 599 -?
    "500 application fail error"
  _other ->
    "Default case"
end
```

If we combine *Pattern Matching* and *Guards* we can introduce **Static Typing**

```Elixir
def zero?(0) do
  true
end

def zero(n) when is_number(n) do
  false
end
```

Here we use a guard to make sure the function only runs if it's provided with a number and if the number is 0 we get the result we want.

We can also use *Pattern matching* to assert on types this will aid with our type safety.

```Elixir
def name(%User{} = user ) do
  user.first_name <> " " user.last_name
end

def name(%Post{name: name}) whem is_binary(name) do
  name
end

def name(unsupported) do
  raise("name? does not support #{inspect unsupported}")
end
```

Here we are checking if a the variables are a certain type of struct. It will also handle each kind of struct differently and if we give it a value that's not supported. We raise an error  of the appropriate kind.

**NOTES**
 - Prefer pattern matching to if
 - Prefer function pipelines to nested if, cond or case statements
