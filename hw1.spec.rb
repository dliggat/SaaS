require 'hw1'

describe HW1 do
  it 'should identify palindromes' do
    HW1.palindrome?('A man, a plan, a canal -- Panama').should == true
    HW1.palindrome?("Madam, I'm Adam!").should == true
    HW1.palindrome?('abba').should == true
    HW1.palindrome?('foo bar').should == false
    HW1.palindrome?('Abracadabra').should == false
  end

  it 'should count words correctly' do
    HW1.count_words('A man, a plan, a canal -- Panama').should == 
      {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    HW1.count_words('Doo bee doo bee doo').should ==
      {'doo' => 3, 'bee' => 2}
  end

  it 'should determine the correct RPS outcome' do
    lambda{HW1.rps_game_winner([])}.should raise_error(HW1::WrongNumberOfPlayersError)
    lambda{HW1.rps_game_winner([['joe', 'Q'], ['bob', 'P']])}.should 
      raise_error(HW1::NoSuchStrategyError)
    HW1.rps_game_winner([['joe', 'R'], ['bob', 'P']]).should == ['bob', 'P']
    HW1.rps_game_winner([['joe', 'R'], ['bob', 'R']]).should == ['joe', 'R']
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
    HW1.rps_tournament_winner(tourn).should == ["Richard", "R"]
  end

  it 'should output the correct anagram list' do
    input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    output = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
    HW1.combine_anagrams(input).should =~ output
  end

  it 'should behave OOP correctly' do
    a = HW1::Dessert.new('ice cream', 200)
    a.healthy?.should == false
    a.delicious?.should == true
    b = HW1::Dessert.new('frozen yogurt', 100)
    b.healthy?.should == true
    b.delicious?.should == true
    c = HW1::JellyBean.new('jellybelly', 100, 'black licorice')
    c.healthy?.should == true
    c.delicious?.should == false
    d = HW1::JellyBean.new('jellybelly', 100, 'watermelon')
    d.healthy?.should == true
    d.delicious?.should == true
  end
end
