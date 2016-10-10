defmodule User do
  @moduledoc """
  Defines the User Struct and functions to handle users.
  """
  #import stuff
  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]

  defstruct name: nil, email: nil

  @doc """
  Get the first name of a user.

  ## Parameters
  - `user` - A User Struct
  ## Examples
  || user = %User{name: "Zacck Osiemo"}
     User.first_name(user)
     "Zacck"

  """
  def first_name(user) do
    user#take the user.name attribute
    |> get_names #use the pipeline operator to pass it into string.split returns a list
    |> first #use the pipeline get the first item in the returned list
  end

  @doc """
  Get the last name of a user.

  ## Parameters
  -- `user` - A User Struct

  ## Examples
  || user = %User{name: "Zacck Osiemo"}
     User.last_name(user)
     "Osiemo"
  """
  def last_name(user) do
    user
    |> get_names
    |> last
  end

  #add a private function
  defp get_names(user) do
    split(user.name)
  end
end
