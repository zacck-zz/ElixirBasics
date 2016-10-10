def blank?(value) do
  # determing whether value is nil, false or " "
  #using case to do pattern mathing
  case value do
    nil -> true
    false -> true
    "" -> true
    _other -> false
  end
end


#function definitions allow pattern matching
def blank?(nil) do: true
def blank?(false) do: true
def blank?("") do: true
def blank?(_other) do: false
