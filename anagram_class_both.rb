 class AnagramSolver
    def same_length_anagrams(word, word_list)
      
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

    def finding_anagrams in_array
      anagrams = {}

       in_array.each do |word|
        word = word.strip
         word_letters = word.gsub(/[^a-z]/i, "")
          key = word_letters.downcase.chars.sort.join
          
    if anagrams.has_key?(key)
      anagrams[key] << word
    else
      anagrams[key] = [word]
    end
  end
      anagrams.delete_if {|key, value| value.length == 1 }
      
       anagrams.each do |key, words|
        puts words.join(" ")
  end
end

end
solver = AnagramSolver.new
puts "Anagram this:"
solver.same_length_anagrams(gets.chomp,'wordlist.txt')
puts
puts "Finding anagrams:"
solver.finding_anagrams(File.readlines("wordlist.txt"))
