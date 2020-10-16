class QuatrefoilPlayer

  attr_accessor :player_name

  def initialize(player_name)
    @player_name = player_name
  end

  # heaps: 7 element array of integers with values 0 - 6, representing board

  # returns two integer array: [column_index, disc_removal_amount]
  # column_index: (0-6) column to remove discs from
  # disc_removal_amount: positive integer 1-6 for number of discs to remove
  def play_round(heaps)
    winning_move_from_state(heaps: heaps)
  end

  private

  def winning_move_from_state(heaps:, depth: 1)
    return if depth > 2
    possible_moves = []

    heaps.each_with_index do |n,i|
      next if n.zero?
      (1..n).to_a.each do |count|
        possible_moves << {column_id: i, count: count}
      end
    end

    ## quick win?
    quick_win_move = possible_moves.find do |move|
      losing_state_for_next_move?(
        heaps: heaps_after_move(heaps: heaps, move: move)
      )
    end
    return quick_win_move.values if quick_win_move

    possible_states = possible_moves.map do |move|
      heaps_after_move(heaps: heaps, move: move)
    end

    good_state = possible_states.find do |possible_state|
      winning_move = winning_move_from_state(heaps: possible_state, depth: depth + 1)
      !!winning_move
    end

    return winning_move_from_state(heaps: good_state) if good_state

    play_round_randomly(heaps)
  end

  def play_round_randomly(heaps) # only for direst need
    column = available_columns(heaps)[ rand(available_columns(heaps).length) ]

    amount = rand( 1..heaps[column] )

    return [column, amount]
  end

  # returns and array of ints representing avail columns
  def available_columns(heaps)
    x = 0

    results = heaps.each_index.select{|i| heaps[i] > 0}

    results
  end

  def heaps_after_move(heaps:, move:)
    heps = heaps.dup
    heps[move[:column_id]] -= move[:count]
    heps
  end

  # amount in stack may not matter beyond is it 1, 2?

  def winning_state_for_next_move?
    # for each possible move that could be made:
      # return true if the move leaves a losing_state_for_next_move for the opponent
    # else
      # false
    # end


    # a player can win with one move
    # / there is a move that makes true losing_state_for_next_move

    # if you can set up 1,1,1 by making your move, it's a winning move
  end

  def losing_state_for_next_move?(heaps:)
    return true if heaps.sort == [0,0,0,0,0,0,1]
    return true if heaps.sort == [0,0,0,0,1,1,1]

    #
    # [0,0,0,0,0,2,2]
    # [0,0,0,0,0,6,6]
  end

end
