module Enumerable

  def my_select (&selection_conditions)    
    # nil -> Array (uses block)
    # Returns an array containing

    # Save new filtered array in result
    result = []
    # Iterate through each array item
    self.my_each do |item|
      # Adds current item to result if conditions in block are met
      result.push(item) if selection_conditions.call(item)
    end
    # Return new array with filtered elements
    return result
  end

  def my_all?
    # nil -> bool (Uses block)
    # Returns true if all items in array meet the 
    # condition in the block else returns false.
    # Note: uses yield

    # Result is true by default while conditions are met
    result = true
    # Go through each array item
    self.my_each do |item|
      # Check if block conditions have not been met on current item
      unless yield(item)
        # Set result to false
        result = false
        # exit my_each block
        break
      end
    end
    result
  end

  def my_any? (&match_conditions)
    # Proc -> bool (Uses block)
    # Returns true if any item in array meets the 
    # condition in the block else returns false.

    # Save result, false by default till a match is found
    result = false
    # Iterate through each item in array
    self.my_each do |item|
      # Check if the conditions have been met in the current item
      if match_conditions.call(item)
        result = true
        break
      end
    end
    result
  end

  def my_none? (&match_conditions)
    # nil -> bool (Uses block)
    # Return true if no array item meets block
    # condition else return false

    # See if any item in the array meets the conditions we want to avoid
    item_meets_condition = self.my_any?(&match_conditions)
    # None of the items meet the condition only if not any (!any) meet the condition
    # none <-> !any
    !item_meets_condition
  end

  def my_count (&count_conditions)
    # nil -> bool (Uses block)
    # Return a count of all elements that meet
    # the condition in the block.
    # Return array length when no block given.

    #Check if a block is provided
    if block_given?
      # Get an array of all elements that meet the conditions
      # Then return the length of this filtered array
      return self.my_select(&count_conditions).length
    # If no block is provided give the original array length
    else
      return self.length
    end

  end

  def my_map
    # nil -> array (Uses block)
    # Returns a new array which is a mapping of the original
    # under some condition (each element is changed under some rule).
    # Note: uses yield
  
    # Stores the result array after mapping
    result = Array.new
    # Iterate through each array item
    self.my_each do |item|
      # Changes item based on conditions and adds to result array
      result.push(yield(item))
    end
    # Return the result array
    result
  end

  def my_inject (initial_value)
    # nil -> bool (Uses block)
    # Takes an initial value and performs an operation
    # on the initial value for each item in the array.
    # Note: uses yield

    # Store the result of the injection
    result = initial_value
    # Iterate through each array item
    self.my_each do |item|
      # Store new value after running block on current result value
      # and the current array element
      result = yield(result, item)
    end
    result
  end

end

# Add my_each method to the Array class
class Array

  def my_each
    # nil -> Array (uses block)
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
