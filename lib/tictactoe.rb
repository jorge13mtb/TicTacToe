=begin
          Class Tictactoe
          Jorge Chavarria Rodriguez
=end

EMPTY_BOX = "-"
MAX_NUMBER_OF_CEllS_IN_TICTACTOE = 9
MINIMUM_NUMBER_OF_TURNS_NEEDED_TO_WIN = 5

class Tictactoe

  attr_accessor :board, :turns

  def initialize
    @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
	  @game_winner = :no_player
    @turns = 0
    @last_row = -1
    @last_column = -1
  end


  def put_cell_at_game(row_position, column_position, game_cell)
	  if @board[row_position][column_position] == EMPTY_BOX
	    @board[row_position][column_position] = game_cell
      @turns += 1
      @last_row = row_position
      @last_column = column_position
    end
  end


  def is_there_a_winner?
    if @turns >= MINIMUM_NUMBER_OF_TURNS_NEEDED_TO_WIN

      row_array = [@board[@last_row][0], @board[@last_row][1], @board[@last_row][2]]
      column_array = [@board[0][@last_column], @board[1][@last_column], @board[2][@last_column]]

      diagonal_1_array = [@board[0][0], @board[1][1], @board[2][2]] if played_in_diagonal_1?
      diagonal_2_array = [@board[0][2], @board[1][1], @board[2][0]] if played_in_diagonal_2?

      winner_in_array? row_array or winner_in_array? column_array or 
      winner_in_array? diagonal_1_array or winner_in_array? diagonal_2_array
    end
  end


  def winner
    @game_winner
   end


  def tie?
	  not is_there_a_winner? and the_board_is_full?
  end


  def clean_the_board
	  for current_row in (0..2)
	    for current_column in (0..2)
		    @board[current_row][current_column] = EMPTY_BOX
	    end
  	end
    @turns = 0
  end

#          *****          These are private functions          *****

  private

  def played_in_diagonal_1?
    @last_row - @last_column = 0
  end


  def played_in_diagonal_2?
    (@last_row = 1 and @last_column = 1) or @last_row - @last_column = -2 or @last_row - @last_column = 2
  end


  def winner_in_array? array_values
	  if all_elements_are_equals?(array_values) and not empty_box?(array_values)
	    @game_winner = array_values[0][0]
    	return true
    end
    false
  end


  def all_elements_are_equals?(array)
	  array.uniq.length == 1
  end


  def empty_box?(array)
	  array.include?(EMPTY_BOX)
  end


  def the_board_is_full?
    cells_in_game = 0
	  for current_row in (0..2)
	    for current_column in (0..2)
		    cells_in_game += 1 if @board[current_row][current_column] != EMPTY_BOX
	    end
	  end
  cells_in_game == MAX_NUMBER_OF_CEllS_IN_TICTACTOE
  end
end
