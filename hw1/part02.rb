class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
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

def rps_tournament_winner(tourn)
  if tourn.first.first.class == String
    return rps_game_winner(tourn)
  else
    return rps_game_winner([rps_tournament_winner(tourn.first),
                            rps_tournament_winner(tourn.last)])
  end
end

