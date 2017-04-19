**GenServer**

**OTP**

This is an acronym for *Open Telephony Protocol*

This is an Erlang system for building distributed systems whether or not they have anything to do with `Telephony`.

**Creating A GenServer**

This can be used to handle  long running processes rather than having to implement the looping for our processes in the processes themselves.


**Starting A GenServer Process**

```Elixir
{:ok, pid} = GenServer.start(CallBackModule, [arg1, arg2], opts)
{:ok, pid} = GenServer.start_link(CallBackModule, [arg1, 1rg2], opts)
```

Just like we in normal processes we can use start or start_link to communicate between the current process and the `GenServer`.

**Example Bank Account as a GenServer**

```Elixir
{:ok, account} =  GenServer.start(BankAccount, 0)

GenServer.cast(account, {:deposit, 50})  #this will send a message to the server without waiting for a response
GenServer.cast(account, {:withdraw, 25})
balance = GenServer.call(account, :balance) #the call function will send a message and pause exection till it is replied to
```

*BankAccount Module*.

```Elixir
defmodule BankAccount do
  use GenServer #lets import genserver so we can use it

  #this is called when the genserver starts the process this uses the parameterw provided when we called start
  def init(balance) do
    {:ok, balance}
  end

  #these return a tuple if the first element is reply this will send a message back to the caller if it is :noreply this will not happen, They take in 2 elements a tuple with the message and amount, the current state of the process.

  def handle_cast({:deposit, amount}, balance) do
    #returns no reply
    #since a deposit increases the balance we add the amount to the balance that is the state 
    {:noreply, balance + amount}
  end

  def handle_cast({:withdraw, amount}, balance) do
    {:noreply, balance - amount}
  end

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end

end
```
