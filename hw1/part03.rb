def combine_anagrams(list)
  anag = Hash.new
  list.each do |word|
    canonical = word.split(//).each {|letter| letter.downcase! }
    canonical = canonical.sort!
    canonical = canonical.join('')
    unless anag.has_key?(canonical)
      anag[canonical] = Array.new
    end
    anag[canonical] << word
  end
  anag.values
end
