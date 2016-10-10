#cond control
cond do
  expr -> code
  true -> default
end

#example
#use cond for if else clauses
cond do
  1 + 1 == 3 -> "The universe is crumbling"
  1 + 1 == 2 -> "Everything is fine"
  5 + 1 == 42 -> "The meaning of life ..."
  true -> "I give up"
end


#case macro
case expr do
  output -> code
  _other -> default
end


case Stripe.Customer.create(attrs) do
  {:ok, customer} ->
    "A customer was created with ID #{ customer.id}"
  {:error, reason} ->
    "Customer could not be created because #{reason}"
  other ->
    "An unknown error occured. #{other}"
end


#if macro
if expr do
  code
end

if 1+1 == 3 do
  "This wont happen"
else
  "This will Happen"
end


if user.admin? do
  # Display the admin interface
else
   # Display the normal user interface
end

unless expression do
  #code
end

#example
#the code in the block will run unless the expression returns a truthy value
unless 1 + 1 == 3 do
  "The laws of math still hold true"
end


#pattern Matching
def blank?(value) do
  #determine whether value os nil, false, or ""
end
