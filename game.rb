# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'



class Game

    def initialize
        @board = Board.new
        @player_1 = Player.new(1,"")
        @player_2 = Player.new(2,"")
        @current_player = ""
    end

    

end

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