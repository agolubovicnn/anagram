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
