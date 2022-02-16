require 'rspec'
require './tictactoe'

describe Tictactoe do
    tictactoe = described_class.new

    it "outputs an empty board" do

    # Act
    position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
    result = tictactoe.display_board()

    # Assert
    expect(result).to eq(expected_board)

    end

    it "outputs board with an 'X' in the first turn" do

    # Act
    position = [["X", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
    
    tictactoe.update_board(0,0,'X')
    result = tictactoe.display_board()

    # Assert
    expect(result).to eq(expected_board)
    
    end
end