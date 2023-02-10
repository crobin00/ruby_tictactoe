# frozen_string_literal: true

require_relative '../board'

describe Board do
  describe '#empty?' do
    subject(:board) { described_class.new }

    context 'when position is empty' do
      it 'returns true' do
        empty = board.empty?(4)
        expect(empty).to be(true)
      end
    end

    context 'when position is not empty' do
      it 'returns false' do
        board.board[2] = 'X'
        empty = board.empty?(2)
        expect(empty).to be(false)
      end
    end
  end

  describe '#place_piece' do
    subject(:piece_board) { described_class.new }

    context 'when position is avaiable for piece' do
      it 'places piece' do
        piece_board.place_piece(2, 'X')
        expect(piece_board.board[2]).to be('X')
      end
    end

    context 'when position is not available' do
      it 'does not place piece' do
        piece_board.board[2] = 'X'
        piece_board.place_piece(2, 'O')
        expect(piece_board.board[2]).to be('X')
      end
    end
  end

  describe '#winner?' do
    subject(:winner_board) { described_class.new }

    context 'when winner is found' do
      it 'returns true' do
        allow(winner_board).to receive(:check_win).and_return(true)
        winner = winner_board.winner?
        expect(winner).to be(true)
      end
    end

    context 'when draw' do
      subject(:winner_board) { described_class.new }
      it 'returns true' do
        9.times { |pos| winner_board.place_piece(pos, 'X') }
        allow(winner_board).to receive(:check_win).and_return(false)
        winner = winner_board.winner?
        expect(winner).to be(true)
      end
    end

    context 'when no winner' do
      it 'returns false' do
        allow(winner_board).to receive(:check_win).and_return(false)
        winner = winner_board.winner?
        expect(winner).to be(false)
      end
    end
  end

  describe '#check_win' do
    subject(:win_board) { described_class.new }

    context 'when X wins across the top' do
      it 'returns true' do
        win_board.instance_variable_set(:@board, ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
        win = win_board.check_win
        expect(win).to be(true)
      end
    end
  end
end
