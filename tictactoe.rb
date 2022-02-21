class Tictactoe
    attr_accessor :position

    def initialize()
        @position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end    

    def update_board(row, column, symbol)
        @position[row][column] = symbol 
        return @position
    end 

    def is_empty?(row, column)
        @position[row][column] == " "
    end
    
    def turn()
        puts "Hello! Welcome to Tic Tac Toe game!"
        puts "When it is you turn, please, write your row first, column second!"
        puts "By default you are playing as 'X' in this game."
        symbol = 'X'
        puts "When it is you turn, please, write your row first, column second!"
        puts "Please enter your row coordinates: "
        row = gets.chomp.to_i 
        puts "and now, please enter your column coordinates: "
        column = gets.chomp.to_i
        
        if is_empty?(row,column)
            update_board(row, column, symbol)
        else
            print "This slote is already taken. Try again!"
        end
      
    end

    def display_board()
        board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
    end

end

