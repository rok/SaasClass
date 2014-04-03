class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless game[0][1].match(/[RPSrps]/) && game[1][1].match(/[RPSrps]/)

  game[0][1].upcase!; game[1][1].upcase!; 
  result = game[0][1] + game[1][1]
  
  if "RS PR SP".match(result)
    return game[0]
  end
  if "RR PP SS".match(result)
    return game[0]
  end
  if "SR RP PS".match(result)
    return game[1]
  end    
end

def rps_tournament_winner(tournament)
  if tournament[0][0].class.to_s == "Array"
    return rps_game_winner( [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])] )
  else
    return rps_game_winner(tournament)
  end
end

# puts rps_game_winner [ ["Armando", "P"], ["Dave", "S"] ]
# puts rps_game_winner [ ["Richard", "s"],  ["Michael", "r"] ]
# puts rps_game_winner [ ["Richard", "r"],  ["Michael", "s"] ]
# puts rps_game_winner [ ["Richard", "r"],  ["Michael", "r"] ]
# puts rps_game_winner [ ["Richard", "s"],  ["Michael", "s"] ]

# tournament = 
# [
#  [
#    [ ["Armando", "P"], ["Dave", "S"] ],
#    [ ["Richard", "R"],  ["Michael", "S"] ],
#  ],
#  [ 
#    [ ["Allen", "S"], ["Omer", "P"] ],
#    [ ["David E.", "R"], ["Richard X.", "P"] ]
#  ]
# ]
# 
# puts rps_tournament_winner(tournament)