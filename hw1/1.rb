def palindrome?(string)
  string.downcase!.gsub!(/[^a-z]/,'')
  return string == string.reverse
end

def count_words(string)
  string = string.downcase.gsub(/ +/,' ').gsub(/[^a-zA-Z]/,' ')
  h = {}
  string.scan(/(\w+)/).uniq.each do |word|
    h.merge!( word[0] => string.scan(/(\w+)/).count(word) )
  end
  return h
end