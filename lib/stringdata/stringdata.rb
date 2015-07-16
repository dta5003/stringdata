# coding: utf-8

module Stringdata
  class StringdataParser
    # @param input [String]
	# @return [String, Number, String, Number, Boolean]
    def parse(input)
	  if input.length == 0
		error = true
	    return nil, nil, nil, nil, error
	  end

	  chars = hashify(input)
	  most_frequent, max_frequency = get_most_frequent(chars.clone)
	  least_frequent, min_frequency = get_least_frequent(chars.clone)
	  error = false
	  
	  return most_frequent, max_frequency, least_frequent, min_frequency, error
	end
	
	# @param input [String]
    # @return [Hash{String => Number}]
    def hashify(input)
	  chars = Hash.new
	  input.split(//).each do |char| # loop through characters in input string
	    if chars.has_key?(char)
	  	  chars[char] += 1 # if already in hash, increment counter
	    else
	  	  chars[char] = 1 # else add to hash with count 1
	    end
	  end
	  return chars
    end
  
    # @param chars [Hash{String => Number}]
    # @return [String, Number]
    def get_most_frequent(chars)
	  max_frequency = chars.values.sort.pop # sort the counter values and take the highest
	  chars.keep_if {|_,v| v == max_frequency} # filter out all characters not having the highest frequency
	  low_char = chars.keys.sort.shift # sort the remaining keys and keep the character with the lowest code point
	
	  return low_char, max_frequency
    end
  
    # @param chars [Hash{String => Number}]
    # @return [String, Number]
    def get_least_frequent(chars)	
	  min_frequency = chars.values.sort.shift # sort the counter values and take the lowest
	  chars.keep_if {|_,v| v == min_frequency} # filter out all characters not having the lowest frequency
	  low_char = chars.keys.sort.shift # sort the remaining keys and keep the character with the lowest code point
	
	  return low_char, min_frequency
    end
  end

  # @param input [String]
  # @return [String, Number, String, Number, Boolean]
  def Stringdata.getStringdata(input)
    p = StringdataParser.new
	return p.parse(input)
  end
  
  # @param input [String]
  def Stringdata.printStringdata(input)
	most_frequent, max_frequency, least_frequent, min_frequency, error = getStringdata(input)
	
	if error
	  puts "Invalid input."
	else
	  puts "The most frequent character is '#{most_frequent}' with #{max_frequency} occurrences."
	  puts "The least frequent character is '#{least_frequent}' with #{min_frequency} occurrences."
	end
  end  
end