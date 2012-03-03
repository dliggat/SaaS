def palindrome?(string)
  string.gsub!(/\W/,'')
  string.downcase!
  return string == string.reverse
end

def count_words(string)
  words = Hash.new(0)
  string.split(' ').each do |word|
    word.gsub!(/\W/,'')
    word.downcase!
    if /\w+/ =~ word
      words[word] += 1
    end
  end
  words
end
