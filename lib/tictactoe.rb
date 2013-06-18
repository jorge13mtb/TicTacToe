=begin
          Class Tictactoe
	  Jorge Chavarria Rodriguez
=end

EMPTY_BOX = "-"
MAX_NUMBER_OF_PIECES_IN_TICTACTOE = 9

class Tictactoe

    attr_accessor :board

    def initialize
        @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
	@game_winner = :no_player
    end


    def put_piece_at_game(row_position, column_position, game_piece)
	if @board[row_position][column_position] == EMPTY_BOX
	    @board[row_position][column_position] = game_piece
        end
    end


    def is_there_a_winner?
        is_there_a_winner_in_row? or is_there_a_winner_in_column? or is_there_a_winner_in_diagonal_1? or is_there_a_winner_in_diagonal_2? 
    end


    def who_is_the_winner?
        @game_winner
    end


    def is_there_a_tie?
	not is_there_a_winner? and the_board_is_full?
    end
 

    def clean_the_board
	for actual_row in (0..2)
	    for actual_column in (0..2)
		@board[actual_row][actual_column] = EMPTY_BOX
	    end
	end
    end    

#                    *****                     These are private functions                    *****

    private

    def is_there_a_winner_in_row?
        for actual_row in (0..2)
	    if all_elements_are_equals?(@board[actual_row]) and not is_there_an_empty_box?(@board[actual_row])
	        @game_winner = @board[actual_row][0]
	        return true
            end
	end
	false
    end


    def is_there_a_winner_in_column?
        for actual_column in (0..2)
            actual_column_values = [@board[0][actual_column], @board[1][actual_column], @board[2][actual_column]]
  
	    if all_elements_are_equals?(actual_column_values) and not is_there_an_empty_box?(actual_column_values)
	        @game_winner = @board[0][actual_column]
		return true 
	    end
	end
	false
    end
    

    def is_there_a_winner_in_diagonal_1?
        diagonal_1_values = [@board[0][0], @board[1][1], @board[2][2]]

	if all_elements_are_equals?(diagonal_1_values) and not is_there_an_empty_box?(diagonal_1_values)
	    @game_winner = @board[0][0]
	    return true
	end
	false 
    end


    def is_there_a_winner_in_diagonal_2?
        diagonal_2_values = [@board[0][2], @board[1][1], @board[2][0]]

	if all_elements_are_equals?(diagonal_2_values) and not is_there_an_empty_box?(diagonal_2_values)
	    @game_winner = @board[0][2]
    	    return true
        end
	false
    end


    def all_elements_are_equals?(array)
	array.uniq.length == 1
    end

 
    def is_there_an_empty_box?(array)
	array.include?(EMPTY_BOX)
    end


    def the_board_is_full?
        pieces_in_game = 0
	for current_row in (0..2)
	    for current_column in (0..2)
		if @board[current_row][current_column] != EMPTY_BOX
		    pieces_in_game += 1
		end
	    end
	end
	pieces_in_game == MAX_NUMBER_OF_PIECES_IN_TICTACTOE
    end
end
