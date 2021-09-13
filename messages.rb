# frozen_string_literal: true

# module to store all messages

module Messages
  def intro
    'Hi, lets play some Tictactoe'
  end

  def player_name_select(number)
    "What is your name Player #{number}"
  end

  def player_symbol_select(number)
    "Please select a character Player #{number}"
  end

  def symbol_select_error
    'Please select another character'
  end

  def input_error
    'Please select an empty cell'
  end

  def player_turn_message(name)
    "#{name}, please make your next move and select a spot"
  end

  def tie_message
    'Neither player won, its a tie!!'
  end

  def win_message(name)
    "Congrats #{name}, You won!!"
  end
end
