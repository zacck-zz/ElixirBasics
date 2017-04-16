
defmodule Payments do
  def dates(term, date) do
    Stream.cycle(["January", "February", "March", "April", "May", "June", "July", "August","September", "October", "November", "December"])
    |> Enum.take(term)
    |> Enum.map(&(&1 <> " - " <> date))
  end
end
