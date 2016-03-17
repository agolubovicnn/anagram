class AnagramSolver
  attr_accessor :dictionary

  def initialize(dictionary)
    self.dictionary = dictionary.map { |word| word.strip }
  end
  
  def anagrams_for_word(word, word_list)
    word_list = File.open(word_list).read.split(/\b/)
    word_hash = Hash[word_list.map { |x| [x.upcase, x.chars.to_a.sort.join.upcase] }]
    word_hash = word_hash.group_by { |key, value| word_hash[key] }

    word_hash.each_pair do |key, value|
      word_hash[key] = value.transpose.delete_at(0)
    end

    if word_hash[word.chars.to_a.sort.join.upcase] == nil
      puts "Sorry! No #{word.length}-letter anagrams found."
    else
      puts word_hash[word.chars.to_a.sort.join.upcase]
    end
  end
  
  def key_for(word)
    word_letters = word.gsub(/[^a-z]/i, "")
    word_letters.downcase.chars.sort.join
  end

  def find_anagrams
    anagrams = {}

    dictionary.each do |word|
      next if word.length == 1
      key = key_for(word)

      if anagrams.has_key?(key)
      anagrams[key] << word
      else
        anagrams[key] = [word]
      end
    end
    anagrams.delete_if {|key, value| value.length == 1 }

    anagrams.values
  end
end
