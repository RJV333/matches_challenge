require_relative 'Player'

class Fumk < Player
  attr_accessor :player_name

  def initialize(player_name = 'Fumk')
    @player_name = player_name
  end

  # make a random move from the columns available
  def play_round(heaps)
    column = available_columns(heaps).find { |index| heaps[index] > 1 } || available_columns(heaps).first

    if available_columns(heaps).size % 2 == 1
      amount = (heaps[column] - 1) == 0 ? 1 : heaps[column] - 1
    else
      amount = heaps[column]
    end


    return [column, amount]
  end

  def available_columns(heaps)
    x = 0

    results = heaps.each_index.select{|i| heaps[i] > 0}

    results
  end

  def remaining_tokens(filtered_heaps)
    count = 0

    filtered_heaps.each do |i|
      count += heaps[i]
    end

    count
  end
end
