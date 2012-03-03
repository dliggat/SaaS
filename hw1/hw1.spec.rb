require 'part01'
require 'part02'
require 'part03'
require 'part04'

module Testing; end  # Dummy module.

describe Testing do
  it 'should identify palindromes' do
    palindrome?('A man, a plan, a canal -- Panama').should == true
    palindrome?("Madam, I'm Adam!").should == true
    palindrome?('abba').should == true
    palindrome?('foo bar').should == false
    palindrome?('Abracadabra').should == false
  end

  it 'should count words correctly' do
    count_words('A man, a plan, a canal -- Panama').should == 
      {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    count_words('Doo bee doo bee doo').should ==
      {'doo' => 3, 'bee' => 2}
  end

  it 'should determine the correct RPS outcome' do
    lambda{rps_game_winner([])}.should raise_error(WrongNumberOfPlayersError)
    lambda{rps_game_winner([['joe', 'Q'], ['bob', 'P']])}.should 
      raise_error(NoSuchStrategyError)
    rps_game_winner([['joe', 'R'], ['bob', 'P']]).should == ['bob', 'P']
    rps_game_winner([['joe', 'R'], ['bob', 'R']]).should == ['joe', 'R']
  end

  it 'should output the correct tournament winner' do
    tourn = 
    [ 
    [
      [  ["Armando", "P"], ["Dave", "S"] ],
      [  ["Richard", "R"], ["Michael", "S"] ], 
    ],
    [
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ] 
    ]
    rps_tournament_winner(tourn).should == ["Richard", "R"]
  end

  it 'should output the correct anagram list' do
    input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    output = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
    combine_anagrams(input).should =~ output
    input = ['hello', 'heLLo', 'foo']
    output = [['hello', 'heLLo'], ['foo']]
    combine_anagrams(input).should =~ output
  end

  it 'should behave OOP correctly' do
    a = Dessert.new('ice cream', 200)
    a.healthy?.should == false
    a.delicious?.should == true
    b = Dessert.new('frozen yogurt', 100)
    b.healthy?.should == true
    b.delicious?.should == true
    c = JellyBean.new('jellybelly', 100, 'black licorice')
    c.healthy?.should == true
    c.delicious?.should == false
    d = JellyBean.new('jellybelly', 100, 'watermelon')
    d.healthy?.should == true
    d.delicious?.should == true
  end
end
