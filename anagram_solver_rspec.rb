require 'rspec'
require './anagram_solver'

describe AnagramSolver do
  
  describe ".new" do
    
    it "ignores everything except letters" do
      given_dictionary = ["abc'", "ab", "cba", "abba", "b!a", "bac"]
      expected_words = [["abc'", "cba", "bac"], ["ab", "b!a"]]
      anagram_solver = AnagramSolver.new(given_dictionary) 
            
      
    end
  end
end
