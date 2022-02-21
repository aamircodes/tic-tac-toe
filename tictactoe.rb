class Tictactoe
    attr_accessor :position

    def initialize()
        @position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end    

    def display_board()
        board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
    end
    
    def update_board(row, column, symbol)
        if is_empty?(row,column)
            @position[row][column] = symbol 
            return @position
        else 
            return "Position is occupied. Try again!"
        end
    end 

    def is_empty?(row, column)
        @position[row][column] == " "
    end

end

