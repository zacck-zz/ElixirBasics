**Sigils**

These are a way of creating short a shorthand.

Consider

```Elixir
%Regex{opts: [], re_pattern, {:re_pattern, 0, 0, ...}}

# with a sigil this becomes

~r/hello/
```


sigis are written by starting with the tilda `~` then content is wrapped by delimiters.

`~r/content/opts`


```Elixir
~r/hello/i
```

Elixir supports 8 different delimiters

1. `~r/hello/i`
2. `~r|hello|i`
3. `~r"hello"i`
4. `~r'hello'i`
5. `~r(hello)i`
6. `~r/[hello]i`
7. `~r{hello}i`
8. `r<hello>i`

**Built In Sigils**

*Word Arrays*

Use `~w` as shorthand for a list of workds

`~w(hello, there)`

`# => ["hello", "there"]`

We can also add an `a` option to make a list of atoms

`~w(hello there)a`

`# => [:hello, :there]`

We can use the `s` sigil to avoid double escaping quote symbols.

`~s("hello")`

to avoid doing.

`"\"hello\""`


particularly helps with documentation when adding double quotes.

The `c` sigil can be used to create a character list.

`~c(some text with a 'direct quote')`

`# => 'some text with a \'direact quote\''`

Use if you want to include an apostrophe in your string.

The `~r` sigil can be used to perform regex expressions
