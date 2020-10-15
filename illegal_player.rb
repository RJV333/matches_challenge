require_relative 'Player'

class IllegalPlayer < Player

  attr_accessor :color, :opponent, :player_name

  def initialize(player_name = 'Shady')
    @player_name = player_name
  end

  # make a random move from the columns available
  def play_round(heaps)
    [-1, -1]
  end
end
