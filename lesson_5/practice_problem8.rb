# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWEL = ['a', 'e', 'i', 'o', 'u']

hsh.each_value do |value|
  value.each do |word|
    word.chars.each do |char|
      puts char if VOWEL.include?(char)
    end
  end
end
