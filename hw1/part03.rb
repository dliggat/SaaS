def combine_anagrams(list)
  anag = Hash.new
  list.each do |word|
    canonical = word.split(//).sort!.each {|letter| letter.downcase! }
    canonical = canonical.join('')
    unless anag.has_key?(canonical)
      anag[canonical] = Array.new
    end
    anag[canonical] << word
  end
  anag.values
end
