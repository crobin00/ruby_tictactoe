# frozen_string_literal: true

# Tic-tac-toe board
class Board
  attr_accessor :board

  WINNING = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = [' ', ' ', ' ',
              ' ', ' ', ' ',
              ' ', ' ', ' ']
  end

  def print_spaces
    puts '1 | 2 | 3'
    puts '4 | 5 | 6'
    puts '7 | 8 | 9'
  end

  def print
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def empty?(position)
    return false if board[position] != ' '

    true
  end

  def place_piece(position, piece)
    return false unless empty?(position)

    board[position] = piece
  end

  def winner?
    return true if check_win

    if board.none?(' ')
      puts 'Draw!'
      return true
    end

    false
  end

  private

  def check_win
    WINNING.any? do |line|
      if line.all? { |winner| board[winner] == 'X' }
        puts 'X Wins!'
        return true
      end
      if line.all? { |winner| board[winner] == 'O' }
        puts 'O Wins!'
        return true
      end
    end

    false
  end
end
