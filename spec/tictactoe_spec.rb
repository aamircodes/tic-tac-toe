require 'rspec'
require './tictactoe'

describe Tictactoe do



    it "outputs an empty board" do

        # Act
        tictactoe = described_class.new

        position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)

    end

    it "outputs board with an 'X' in the first turn at position [0][0]" do

        # Act
        tictactoe = described_class.new

        position = [["X", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
        
        tictactoe.update_board(0,0,'X')
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)
    
    end

    it "outputs board with an 'X' in the [0][1] position of board" do

        # Act
        tictactoe = described_class.new
        
        position = [[" ", "X", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
        
        tictactoe.update_board(0,1,'X')
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)
    
    end
end