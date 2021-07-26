def check_value(value)
  if value % 5 == 0 && value > 0 
    value
  else
    raise("Bad value. Enter value multiple of 5")
  end
end

input = check_value(200) #set value
cash = { "5" => 11, "20" => 12, "50" => 13, "100" => 14 } #set ATM cash
output_cash = {}

while input != 0 do
  clean_cash = cash.select {|k, v| k.to_i <= input }
  max_value = clean_cash.values.max

  if input >= clean_cash.key(max_value).to_i
    input = input - cash.key(max_value).to_i
    cash[clean_cash.key(max_value)] -= 1
    output_cash[clean_cash.key(max_value)] =+ 1 rescue 0
  else
    break
  end
  
end

p "Result:"
puts output_cash.map{|k,v| "#{v} - #{k}"}

p "Following ATM state:"
puts cash.map{|k,v| "#{v} - #{k}"}