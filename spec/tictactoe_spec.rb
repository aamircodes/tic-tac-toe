require 'rspec'
require './tictactoe'

describe Tictactoe do

    it "outputs an empty board" do

        # Act
        tictactoe = described_class.new

        position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
        
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)

    end

    it "outputs board with an 'X' in the first turn at position [0][0]" do

        # Act
        tictactoe = described_class.new

        position = [["X", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
        
        tictactoe.update_board(0,0,'X')
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)
    
    end

    it "outputs board with an 'X' in the [0][1] position of board" do

        # Act
        tictactoe = described_class.new

        position = [[" ", "X", " "], [" ", " ", " "], [" ", " ", " "]]
        expected_board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
        
        tictactoe.update_board(0,1,'X')
        result = tictactoe.display_board()

        # Assert
        expect(result).to eq(expected_board)
    
    end

    it "outputs board with an 'X' and 'O' in separate positions" do

        # Act
        tictactoe = described_class.new
        
        position = [[" ", "X", " "], [" ", "O", " "], [" ", " ", " "]]
        expected_board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
        
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
        expected_board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]

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


    it "checks if turn function works" do

        # Act
        tictactoe = described_class.new

        # Assert
        expect(tictactoe).to respond_to(:player_turn)
    
    end 

    it "checks conversion of user row input to index" do

        # Act
        tictactoe = described_class.new
        
        allow(tictactoe).to receive(:row_input_to_index).and_return(0)
        result = tictactoe.row_input_to_index()

        # Assert
        expect(result).to eq(0)
    
    end 

    # it "checks game function" do

    #     # Act
    #     tictactoe = described_class.new

    #     allow(tictactoe).to receive(:row_input_to_index).and_return(0,1,2)
    #     allow(tictactoe).to receive(:column_input_to_index).and_return(0,1,2)

    #     tictactoe.game

    #     result = tictactoe.position
    #     expected_position = [["X", "O", "O"], 
    #                          [" ", "X", " "], 
    #                          [" ", " ", "X"]]

    #     # Assert
    #     expect(result).to eq(expected_position)
    
    # end 

    it "checks if combination is not winning" do

        # Act
        tictactoe = described_class.new

        tictactoe.update_board(0,0,"X")
        tictactoe.update_board(0,1,"X")
        tictactoe.update_board(1,2,"X")

        # puts "           "
        # puts tictactoe.display_board

        result = tictactoe.win?
        expected_result = false

        # Assert
        expect(result).to eq(expected_result)
    
    end 

    it "checks if combination is winning" do

        # Act
        tictactoe = described_class.new

        tictactoe.update_board(0,0,"O")
        tictactoe.update_board(1,1,"O")
        tictactoe.update_board(2,2,"O")

        # puts "           "
        # puts tictactoe.display_board

        result = tictactoe.win?
        expected_result = true

        # Assert
        expect(result).to eq(expected_result)
    
    end

    it "prints 'Invalid input. Try again!'  when user row input is a number > 3" do 
        tictactoe = described_class.new

        allow(tictactoe).to receive(:gets).and_return("4", "1")

        expect_msg = a_string_including('Invalid input. Try again!')
        expect { tictactoe.column_input_to_index }.to output(expect_msg).to_stdout
    end

    # it "game ends with 'you won'" do

    #     # Arrange
    #     tictactoe = described_class.new

    #     # Act
    #     allow(tictactoe).to receive(:gets).and_return("1", "1", "2", "2", "3", "3")
    #     expected_message = a_string_including("Congratulations!")

    #     # Assert
    #     expect {tictactoe.game}.to output(expected_message).to_stdout
    
    # end

    it "checks computer function" do

        # Act
        tictactoe = described_class.new

        # Assert
        expect(tictactoe).to respond_to(:computer_turn)
    
    end


    it "checks who_won? function" do

        # Act
        tictactoe = described_class.new

        # Assert
        expect(tictactoe).to respond_to(:who_won?)
    
    end 

end