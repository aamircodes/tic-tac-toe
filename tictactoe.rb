class Tictactoe
    attr_accessor :position
    attr_accessor :turn_count

    def initialize()
        @position = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        @turn_count = 0
    end    

    def update_board(row, column, symbol)
        @position[row][column] = symbol 
        return @position
    end 

    def is_empty?(row, column)
        @position[row][column] == " "
    end

    def winning_combinations()
        permutation_one = @position[0][0], @position[0][1], @position[0][2]
    end

    def turn()
        @turn_count = 0
        while @turn_count < 9
            k = 0
            while k == 0 
                print "Please enter your symbol: "
                symbol = gets.chomp
                print "Please enter your row coordinates: "
                row = gets.chomp.to_i 
                print "And now, please enter your column coordinates: "
                column = gets.chomp.to_i

                if is_empty?(row,column)
                    update_board(row, column, symbol)
                    k += 1
                    @turn_count += 1
                else     
                    print "This slot is already taken, try again! "
                end     
            end
        end
    end


    def display_board()
        board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
    end

end

