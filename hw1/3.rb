def combine_anagrams(words)
  a = []
  words.each do |word|
    anagrams = anagrams_of(word, words)
    a << anagrams
  end
  return a.uniq
end

def anagrams_of(a, words)
  anagrams = []
  words.each do |word|
    if anagrams?(a, word)
      anagrams << word
    end
  end
  return anagrams
end

def anagrams?(a,b)
  if a.downcase.split(//).sort == b.downcase.split(//).sort
    return true
  else 
    return false
  end
end

#puts combine_anagrams(['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'Creams', 'scream'])
#puts combine_anagrams([])