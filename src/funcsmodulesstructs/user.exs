defmodule User do
  @moduledoc"""
  Defines the user struct and functions to handle users
  """


  #import only the functions we need
  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]
  # define a user struct
  defstruct name: nil, email: nil


  @doc"""
  get the first name of a user

  ## parameters

    -`user` - A User struct

  ##examplees
    user = %User{name: "Zacck Osiemo"}
    User.first_name(user)
    "Zacck"
  """
  def first_name(user) do
    user.name
    |> split
    |> first
  end

  @doc"""
  get the last name of a user

  ## parameters

    -`user` - A User struct

  ##examplees
    user = %User{name: "Zacck Osiemo"}
    User.last_name(user)
    "Osiemo"
  """
  def last_name(user) do
    user.name
    |> split
    |> last
  end
end
