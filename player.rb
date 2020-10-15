class Player

  attr_accessor :color, :opponent

  def initialize(player_name)
    @player_name = player_name
  end

  # heaps: 7 element array of integers with values 0 - 6, representing board

  # returns two integer array: [column_index, disc_removal_amount]
  # column_index: (0-6) column to remove discs from
  # disc_removal_amount: positive integer 1-6 for number of discs to remove
  def play_round(heaps)
    fail 'NOT IMPLEMENTED'
  end
end
