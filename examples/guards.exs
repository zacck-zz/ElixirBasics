#Guards can be used to check that parameters meet some criteria before running the function

#using Guards
def my_function(arg) when expr do
  #my code
end


#using guards with pattern matchinf
def blank?(value) when value in [nil, false,  ""], do: true
def blank(_other), do: false


#case statements also support blanks
def blank?(value) do
  case value do
    value when in [nil, false, ""] -> true
    _ -> false
  end
end

#guards can be used in case statements to check the results of patterns
case response do
  {:ok, body} ->
    #success
  {:error, status_code, body} when status_code  in 400..499 ->
    #handle 400 status codes
  _other ->
   #default case
end

#combined pattern matching and guards can be used to do static typing
def zero?(0) do
  true
end

def zero(n) where is_number(n) do
  false
end

#guards can be used to assert that variables are a certain type of struct
def name(%User{} = user) do
  user.first_name <> " " <> user.last_name
end

def name(%Episode{name: name}) when is_binary(name) do
  name
end

def name(unsupported) do
  raise "name? dose not support #{inpect unsupported}"
end
