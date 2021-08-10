# frozen_string_literal: true

# board class to create board, display board, update board

class Board
    attr_reader :cells
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

end


