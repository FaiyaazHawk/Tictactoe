# frozen_string_literal: true

# board class to create board, display board, update board

class Board
  attr_accessor :cells

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}"
    puts '---*---*---'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}"
    puts '---*---*---'
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}"
  end

  def update_board(number, symbol)
    @cells[number - 1] = symbol
  end

  def is_winner?(player)
    if WINNING_COMBOS.any? { |combo| (combo - player.moves).empty? }
      TRUE
    else
      FALSE
    end
  end

  def board_filled?
    @cells.all? { |cell| cell =~ /[a-zA-Z]/ }
  end

  def proper_move?(number)
    cells[number - 1] == number
  end
end
