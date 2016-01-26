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
    end


solver = AnagramSolver.new
puts "Anagram this:"
solver.same_length_anagrams(gets.chomp, 'wordlist.txt')
