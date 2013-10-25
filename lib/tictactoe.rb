=begin
          Class TicTacToe
          Jorge Chavarria Rodriguez
=end

EMPTY_BOX = "-"
MINIMUM_NUMBER_OF_TURNS_NEEDED_TO_WIN = 5

class TicTacToe

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
      current_row = [@board[@last_row][0], @board[@last_row][1], @board[@last_row][2]]
      current_column = [@board[0][@last_column], @board[1][@last_column], @board[2][@last_column]]
      diagonal_1 = [@board[0][0], @board[1][1], @board[2][2]]
      diagonal_2 = [@board[0][2], @board[1][1], @board[2][0]]

      winner_in? current_row or winner_in? current_column or
      (played_in_diagonal_1? and winner_in? diagonal_1) or (played_in_diagonal_2? and winner_in? diagonal_2)
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

#          *****          These are private methods          *****

  private

  def played_in_diagonal_1?
    @last_row = @last_column
  end


  def played_in_diagonal_2?
    (@last_row = 1 and @last_column = 1) or @last_row - @last_column = -2 or @last_row - @last_column = 2
  end


  def winner_in? array
    if all_elements_are_equals?(array) and not empty_box?(array)
      @game_winner = array[0][0]
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
    for current_row in (0..2)
      for current_column in (0..2)
        false if @board[current_row][current_column] == EMPTY_BOX
      end
    end
    true
  end
end
