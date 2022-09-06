module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    # nil -> nil
    # applies a yield block on each item in the array
    # Note: uses yield

    # save current array length
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
