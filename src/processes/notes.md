**Processes**


Processes are the core concept of the BEAM Virtual Machine.

**Spawning Processes**

We can create new Processes using the `spawn` macro.

```Elixir
spawn fn ->
  IO.puts "This will be a different Process"
end
```

or in code we can use

`spawn SomeModule, :some_function, [arg1, arg2]`

Processes don't share memory. Everything a process needs is copied over.

These are not operating system processes and hence do not suffer the same pitfalls.

**Messaging**

We use this to hear back from processes.

When you spawn a process you will get a Process Identifier `pid` back

`pid = spawn(fn ->  ... end)`

You can also get the current process's pid using `self()`

A `pid` is an elixir core data type.

You can send a process a message using `send()`


```Elixir
pid = spawn(fn  ->  ... end)

send pid, :message
```

**Sending Message**
Every BEAM process has a mailbox that recieves messages and stores then till they are handled.

You can use the `receive` macro to get messages out of these mailboxes

```Elixir
receive do
  message -> # do some stuff
end  
```
The receive macro allow using pattern matching to enable one to use different messages to run different flows

```Elixir
receive do
  {:say, msg} ->
    IO.puts(msg)
  {:think, msg} ->
    Logger.debug(msg)
  _other ->
    #default case
  end
```

You can limit the amount of time a process should wait for a message using the `after clause`

```Elixir
receive do
  message -> process(message)
after 500 ->
  #do something
end
```

**Process Death**

processes die.
We can handle this is some ways. To tie process to another in such a way that if the other fails it will to we can use `spawn_link`

```Elixir
romeo = self
juliet = spawn_link(fn -> ... end)
#this will kill the current process as it is also linked to the process we are killing
Process.exit(juliet, :kill)
```
