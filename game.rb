# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'messages.rb'



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
        Player.new(name,symbol)
    end
    
    def player_turns
        @current_player = player_1
        until board.board_filled?
                turn(current_player)
                break if board.is_winner?(current_player)
                current_player = change_current_player
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
        player.moves += move
        board.update_board(move -1, player.symbol)
        board.show_board    
    end

    def turn_input(player)
        puts player_turn_message(player.name)
        number = gets.chomp.to_i
        if number != @cells[number -1]
                puts input_error
                number = gets.chomp.to_i
        else
                return number
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
=begin
Overview of tic tac toe game and how it will proceed

Initialize the game
will have new board
will have new player 1 = ''
will have new player 2 = ''
will have current player = ''

Display: Hi there, Lets play Tictactoe
Display: Whats your name Player 1?
        gets.chomp player 1 name
Display: What charactor/symbol do you want to be represented by?
        gets.chomp player 1 symbol

Display: Whats your name Player 2?
        gets.chomp player 2 name
Display: What charactor/symbol do you want to be represented by?
        gets.chomp player 2 symbol

Display: Heres the board
        display board

        set current player to player 1
Display: Ask current player to select cell 
        gets.chomp player 1 move
        update player move
        update board with player 1 move
        check if current player is winner ? (check player move against winning combos) CHECKWIN function
        If no winner, update current player to player 2
        have player 2 take turn
        check for win
        keep playing until board filled; if so, declare tie BOARDFILLED function

        

=end