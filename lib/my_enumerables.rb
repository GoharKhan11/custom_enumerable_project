module Enumerable
  # Your code goes here

  def my_select
    # Array -> Array (uses block)
    # Returns an array containing
    # Note: uses yield

    # Save new filtered array in result
    result = []
    # Iterate through each array item
    self.my_each do |item|
      # Adds current item to result if conditions in block are met
      result.push(item) if yield(item)
    end
    # Return new array with filtered elements
    return result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    # Array -> Array (uses block)
    # applies a yield block on each item in the array
    # Note: uses yield

    # Save current array length
    array_length = self.length
    # Counter to iterate through all the array items
    item_counter = 0
    # Goes through all array items
    while item_counter < array_length
      # Applies yield block to each array item
      yield(self[item_counter])
      # Move to next item
      item_counter += 1
    end
    # Return array
    self
  end

end
