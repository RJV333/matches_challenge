class ContraPlayer

  attr_accessor :player_name

  def initialize(player_name)
    @player_name = player_name
  end

  # heaps: 7 element array of integers with values 0 - 6, representing board

  # returns two integer array: [column_index, disc_removal_amount]
  # column_index: (0-6) column to remove discs from
  # disc_removal_amount: positive integer 1-6 for number of discs to remove
  def play_round(heaps)

    available_columns = available_columns(heaps)
    # fail 'NOT IMPLEMENTED'

    if available_columns.length == 1
        column = available_columns.first
        row_amount = heaps[column]

        case row_amount
          when 2
            amount = 1
          when 3
            amount = 2
          when 4
            amount = 3
          when 5
            amount = 4
          when 6
            amount = 5
        end

    else
      available_columns.length > 1
      column = rand(available_columns.length)
      amount = heaps[column]
    end

    return [column, amount]
  end



  def available_columns(heaps)
    x = 0

    results = heaps.each_index.select{|i| heaps[i] > 0}

    results
  end
end
