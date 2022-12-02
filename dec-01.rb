#dec-01.rb

# parts one and two.
# thoughts for part two:
# cycle through each line, compare add up til empty line found
# compare that total to the current top three
# if it's greater than the lowest one in the top three, pop it off, add the current sum in
# re-sort top array

totalCalories = 0
maxCalories = 0
topThree = [0, 0, 0] # top three calorie values
totalValues = [] # the total for each elf.

IO.foreach('dec-01-input.txt') do |calorieCount|
  # parse to an integer
  calorieCountInt = calorieCount.to_i

  # do our comparisons if we're at the empty line
  if calorieCount.strip.empty?

    # do we have a new maxCalories?
    if totalCalories > maxCalories
      maxCalories = totalCalories
    end

    # do we need to add this to the top three array?
    if totalCalories > topThree[0]
      # remove first item in the sorted array
      topThree.shift

      # add the current total calories to the array
      topThree.push(totalCalories)

      # and re-sort topThree in ascending order
      # need the exclamation point to actually mutate the topThree array, argh, foiled
      topThree.sort!
    end

    # reset running total for the next round, and add to total values array
    totalValues.push(totalCalories)
    totalCalories = 0
    next
  else
    totalCalories += calorieCountInt
  end
end

# add the last sum to the list of total values, and check the final against the current max
totalValues.push(totalCalories)

if totalCalories >= maxCalories
  maxCalories = totalCalories
  # and we def have a top three candidate!
  topThree.shift
  topThree.push(totalCalories)
end

puts 'maxCalories:', maxCalories

totalTopCalories = 0
topThree.each do |count|
  puts count
  totalTopCalories += count
end

puts 'total top calories:', totalTopCalories

# try sorting total values and grabbing the last three to sum
totalValues.sort!
length = totalValues.length
sum = totalValues[length-1] + totalValues[length-2] + totalValues[length-3]
puts 'using total values, total top calories: ', sum


