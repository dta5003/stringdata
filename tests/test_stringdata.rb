# coding: utf-8

require "stringdata/stringdata.rb"
require "test/unit"

class TestStringdata < Test::Unit::TestCase

  def test_word()
    most_frequent, max_frequency, least_frequent, min_frequency, error = Stringdata.getStringdata("supercalifragilisticexpialidocious")
										
	assert_equal(most_frequent, "i")
	assert_equal(max_frequency, 7)
	assert_equal(least_frequent, "d")
	assert_equal(min_frequency, 1)
	assert(!error)
  end
	
  def test_empty_string()
  	most_frequent, max_frequency, least_frequent, min_frequency, error = Stringdata.getStringdata("")
	
	assert_nil(most_frequent)
	assert_nil(max_frequency)
	assert_nil(least_frequent)
	assert_nil(min_frequency)
	assert(error)
  end
	
  def test_equal_min_and_max_freq()
	most_frequent, max_frequency, least_frequent, min_frequency, error = Stringdata.getStringdata("aaa")
	
    assert_equal(most_frequent, "a")
	assert_equal(max_frequency, 3)
	assert_equal(least_frequent, "a")
	assert_equal(min_frequency, 3)
	assert(!error)
  end
  
  def test_lots_of_whitespace()
    most_frequent, max_frequency, least_frequent, min_frequency, error = Stringdata.getStringdata("    	") # 4 spaces followed by a tab
	
    assert_equal(most_frequent, " ") # space
	assert_equal(max_frequency, 4)
	assert_equal(least_frequent, "	") # tab
	assert_equal(min_frequency, 1)
	assert(!error)
  end
end