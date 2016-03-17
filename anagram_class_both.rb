require './anagram_solver'

solver = AnagramSolver.new(File.readlines("wordlist.txt"))

puts "Anagram this:"
solver.anagrams_for_word(gets.chomp, "wordlist.txt")
puts
puts "Finding anagrams:"
solver.find_anagrams.each do |words|
  puts words.join(" ")
end
