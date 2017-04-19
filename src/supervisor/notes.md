**Supervisor**

Error Handling Philosophy.

OTP
1. Let it Crash.
2. Separate Code into processes that can't crash any other things.
3. Little or no exceptions handling.


**SuperVisors**

This are processes that are responsible for watching other processes and restarting them if they crash.

An Example would look like

```Elixir
defmodule MyApp.SuperVisor do
  #use the module to get the features
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    #we have an init function to do set up
    children = [
      #should be a gen server
      worker(ProcessA, [args])
      worker(ProcessB, [args])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
```

**Restart Strategies**
`:one_for_one`

This will restart a single process if it dies.

`:simple_one_for_one`

`:one_for_all`
will restart all processes

`:rest_for_one`


**Real World EXample**

- Ecto Elixir Database.
- Phoenix
- A multiplayer game

**Supervisioin Trees Enable**

- Error Isolation.
- Elegant error recovery.
- Self-healing systems.

**What Processes Do I Need?**

**Tips**

1. You can create a supervised mix project by using the `--sup` option.

`mix new my_app --sup`

2. Genserver processes can be named using the name option.

```Elixir
GenServer.start_link(Game.Cache,[], name: Game.Cache)
GenServer.cast(Game.Cache, {:save, state})
```

3. Supervised worker processes can also have IDs using the `:id` option.

`worker(SupervisedProcess, [], id: "some-id")`
