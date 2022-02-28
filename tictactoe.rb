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

    def win?()
        winning_combinations = [
            [@position[0][0], @position[0][1], @position[0][2]],
            [@position[0][0], @position[1][0], @position[2][0]],
            [@position[2][0], @position[2][1], @position[2][2]],
            [@position[0][2], @position[1][2], @position[2][2]],
            [@position[0][0], @position[1][1], @position[2][2]],
            [@position[0][2], @position[1][1], @position[2][0]],
            [@position[1][0], @position[1][1], @position[1][2]],
            [@position[0][1], @position[1][1], @position[2][1]]
        ]

        
        for combination in winning_combinations do
            if (combination[0] == combination[1]) && (combination[1] == combination[2] && (combination[2] != " "))
                return true
            end
        end
        return false


    end


    def user_input_to_index()
        print "Please enter your row coordinates: "
        row = gets.chomp.to_i - 1
        print "And now, please enter your column coordinates: "
        column = gets.chomp.to_i - 1
        return [row, column]
    end

    def turn(symbol)
        stop = 0
        while stop == 0 
            user_input = user_input_to_index()
            row = user_input[0]
            column = user_input[1]

            if is_empty?(row,column)
                update_board(row, column, symbol)
                puts display_board
                stop += 1
            else     
                print "This slot is already taken, try again! "
            end     
        end
    
    end

    def game()
        puts display_board()

        win? == false
        while @turn_count < 9 && (win? == false)
            if @turn_count.even? 
                turn('X')
                @turn_count += 1
            else 
                turn('O')
                @turn_count += 1
            end
        end

        if win? == true
            "You won!"
        else 
            "draw"
        end

    end


    def display_board()
        board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
    end

end

