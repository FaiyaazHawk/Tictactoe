# frozen_string_literal: true

# Player class to create a player, allow it to select its symbol for board and to track its moves

class Player
  attr_accessor :name, :symbol, :moves

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @moves = []
  end
end
