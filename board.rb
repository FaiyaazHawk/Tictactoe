# frozen_string_literal: true

# board class to create board, display board, update board

class Board
    attr_reader :cells

    @@winning_combos = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
  ]

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}"
    puts "---*---*---"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}"
    puts "---*---*---"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}"
  end

  def update_board(number, symbol)
    @cells[number - 1] = symbol
  end
  
  def is_winner?(moves)
    #check player moves against winning combos and return true is moves in winning combo
  end

  def is_tie?(cells)
    #check cells to see if all filled with symbols
  end

end


