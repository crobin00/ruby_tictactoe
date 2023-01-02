# frozen_string_literal: true

require_relative 'board'

# Game
class Game
  attr_accessor :board, :current_turn

  PLAYER1 = 'X'
  PLAYER2 = 'O'
  def initialize
    @board = Board.new
    @current_turn = PLAYER1
  end

  def run
    print_board

    until board.winner?
      play_move
      print_board
    end
  end

  private

  def print_board
    puts 'Valid moves:'
    board.print_spaces
    puts "Current board:\n"
    board.print
  end

  def play_move
    puts "#{current_turn}'s turn"
    puts 'Enter a move: '
    player_position = gets.chomp.to_i - 1
    place_piece(player_position)
  end

  def valid_move?(position)
    if position.negative? || position > 8
      puts "Out of board move\n\n"
      return false
    end

    unless board.empty?(position)
      puts "Space occupied\n\n"
      return false
    end

    true
  end

  def place_piece(position)
    return unless valid_move?(position)

    board.place_piece(position, current_turn)
    change_turn
  end

  def change_turn
    self.current_turn = current_turn == PLAYER1 ? PLAYER2 : PLAYER1
  end
end
