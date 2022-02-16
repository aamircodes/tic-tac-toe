class Tictactoe
    attr_accessor :position

    def initialize()
        @position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end    

    def display_board()
        board = [" #{position[0]} | #{position[1]} | #{position[2]} ",  "-----------",  " #{position[3]} | #{position[4]} | #{position[5]} ",  "-----------", " #{position[6]} | #{position[7]} | #{position[8]} "]
    end
end

