module HW1
  def self.palindrome?(string)
    string.gsub!(/\W/,'')
    string.downcase!
    return string == string.reverse
  end

  def self.count_words(string)
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

  class WrongNumberOfPlayersError < StandardError; end
  class NoSuchStrategyError < StandardError; end
  
  def self.rps_game_winner(game)
    if game.length != 2
      raise(WrongNumberOfPlayersError)
    end
    strat = %W{R P S}
    first, second = game.first.last.upcase, game.last.last.upcase
    
    unless strat.include?(first) and strat.include?(second)
      raise (NoSuchStrategyError)
    end
    if (first == 'S' and second == 'R') or
       (first == 'R' and second == 'P') or
       (first == 'P' and second == 'S')
       return game.last
    else
      return game.first
    end
  end

  def self.rps_tournament_winner(tourn)
    if tourn.first.first.class == String
      return self.rps_game_winner(tourn)
    else
      return self.rps_game_winner([rps_tournament_winner(tourn.first),
                                  rps_tournament_winner(tourn.last)])
    end
  end

  def self.combine_anagrams(list)
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

  class Dessert
    def initialize(name, calories)
      @name = name
      @calories = calories
    end

    def healthy?
      return @calories < 200
    end

    def delicious?
      true
    end
  end

  class JellyBean < Dessert
    def initialize(name, calories, flavor)
      super(name, calories)
      @flavor = flavor
    end

    def delicious?
      if @flavor == 'black licorice'
        return false
      else
        return super
      end
    end

    attr_reader :flavor
    attr_writer :flavor
  end
end







