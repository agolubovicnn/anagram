class AnagramSolver
    def same_length_anagrams(word, word_list)
            
            word_list = File.open(word_list).read.split(/\b/)
            
            word_hash = Hash[word_list.map { |x| [x.upcase, x.chars.to_a.sort.join.upcase] }]
            # Group hash elements by values
            word_hash = word_hash.group_by { |key, value| word_hash[key] }
            # Remove non-word values
            word_hash.each_pair do |key, value|
                word_hash[key] = value.transpose.delete_at(0)
            end

            # Search for anagrams
            if word_hash[word.chars.to_a.sort.join.upcase] == nil
                puts "Sorry! No #{word.length}-letter anagrams found."
            else
                puts word_hash[word.chars.to_a.sort.join.upcase]
            end
            def finding_anagrams in_array
  anagrams = {}

  in_array.each do |word|
    word = word.strip
    word_letters = word.gsub(/[a...]/, "")
    key = word_letters.chars.sort.join
    
    if anagrams.has_key?(key)
      anagrams[key] << word
    else
      anagrams[key] = [word]
    end
  end

  anagrams.delete_if {|key, value|  value.length ==1 }
end
filename = File.readlines "wordlist.txt"

anagrams = finding_anagrams(filename)

anagrams.each do |key, words|
  puts words.join(", ")
 
      end
     end
        
   end


solver = AnagramSolver.new
puts "Anagram this:"
solver.same_length_anagrams(gets.chomp, 'wordlist.txt')
