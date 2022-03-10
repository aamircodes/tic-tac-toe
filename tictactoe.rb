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

    def put_output(output)
        puts output
    end

    def row_input_to_index()
        stop = false
        while stop == false
            print "Please enter your row coordinates: "
            row = gets.chomp.to_i - 1

            if row.between?(0, 2) && row.is_a?(Integer)
                stop == true
                return row
            else
                puts "Invalid input. Try again! "
            end
        end
    end

    def column_input_to_index()
        stop = false
        while stop == false
            print "And now, please enter your column coordinates: "
            column = gets.chomp.to_i - 1

            if column.between?(0, 2) && column.is_a?(Integer)
                stop == true
                return column
            else
                print "Invalid input. Try again! "
            end
        end
    end

    def player_turn()
        symbol = "X"
        stop = 0
        while stop == 0 
            row = row_input_to_index()
            column = column_input_to_index()

            if is_empty?(row,column)
                update_board(row, column, symbol)
                puts display_board
                stop += 1
            else     
                print "This slot is already taken, try again! "
            end     
        end
    
    end

    def computer_turn()
        symbol = "O"
        stop = false
        for row in @position
            for column in row
                if column == " "
                    @position[@position.index(row)][row.index(column)] = symbol
                    puts "\nComputers turn: \n"
                    puts display_board
                    return @position
                    stop = true
                end
            end
        end
    end

    def game()
        puts display_board()

        win? == false
        while @turn_count < 9 && (win? == false)
            if @turn_count.even? 
                player_turn()
                @turn_count += 1
            else 
                computer_turn()
                @turn_count += 1
            end
        end

        if win? == true
            put_output("Congratulations!")
        else 
            put_output("This game ended in a draw.")
        end

    end


    def display_board()
        board = [" #{position[0][0]} | #{position[0][1]} | #{position[0][2]} ",  "-----------",  " #{position[1][0]} | #{position[1][1]} | #{position[1][2]} ",  "-----------", " #{position[2][0]} | #{position[2][1]} | #{position[2][2]} "]
    end

end

tictactoe_game = Tictactoe.new
tictactoe_game.game