# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'messages'

class Game
  include Messages
  attr_accessor :board, :player_1, :player_2, :current_player

  def initialize
    @board = Board.new
    @player_1 = nil
    @player_2 = nil
    @current_player = nil
  end

  def play
    game_setup
    board.show_board
    player_turns
    finish_game
  end

  def game_setup
    puts intro
    @player_1 = create_player(1)
    @player_2 = create_player(2)
  end

  def create_player(number)
    puts player_name_select(number)
    name = gets.chomp
    puts player_symbol_select(number)
    symbol = gets.chomp
    if symbol =~ /[a-zA-Z]/

    else
      puts symbol_select_error
      symbol = gets.chomp
    end
    Player.new(name, symbol)
  end

  def player_turns
    @current_player = player_1
    until board.board_filled?

      break if board.is_winner?(current_player)

      turn(current_player)
      @current_player = change_current_player
    end
  end

  def change_current_player
    if current_player == player_1
      player_2
    else
      player_1
    end
  end

  def turn(player)
    move = turn_input(player)
    player.moves += Array(move - 1)
    board.update_board(move, player.symbol)
    board.show_board
  end

  def turn_input(player)
    puts player_turn_message(player.name)
    number = gets.chomp.to_i
    if board.proper_move?(number)
      number
    else
      puts input_error
      number = gets.chomp.to_i
    end
  end

  def finish_game
    if board.board_filled?
      puts tie_message
    else
      puts win_message(current_player.name)
    end
  end
end

game = Game.new
game.play
