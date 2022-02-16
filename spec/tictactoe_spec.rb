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

    it "outputs board with an 'X' and 'O' in separate positions" do

        # Act
        tictactoe = described_class.new
        
        position = [[" ", "X", " "], [" ", "O", " "], [" ", " ", " "]]
        expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
        
        tictactoe.update_board(0,1,'X')
        tictactoe.update_board(1,1,'O')
            

        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)
    
    end

    it "checks if position is empty" do

        # Act
        tictactoe = described_class.new
        
        position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]

        result = tictactoe.is_empty?(1,1)

        # Assert
        expect(result).to eq(true)
    
    end

    it "checks if position is full" do

        # Act
        tictactoe = described_class.new
        
        tictactoe.update_board(1,1,'X')

        result = tictactoe.is_empty?(1,1)

        # Assert
        expect(result).to eq(false)
    
    end
end