=begin
          Tictactoe Rspec
	        By Jorge Chavarria Rodriguez
=end

require 'tictactoe.rb'

describe TicTacToe do

  before do
	  @tictactoe = TicTacToe.new
   end

  describe "initialize the tictactie" do
 	  it "values of the beginning of the tictactoe game" do
	    @tictactoe.should_not be_nil
	    @tictactoe.board.should == [["-","-","-"],["-","-","-"],["-","-","-"]]
    end
  end

  describe "to play" do
    before { @tictactoe.board = [["X","0","-"],["-","-","-"],["X","0","X"]]
             @tictactoe.turns = 4 }

    it "put two cells in different places" do
	    @tictactoe.put_cell_at_game(0,2,"X")
	    @tictactoe.put_cell_at_game(1,0,"0")
	    @tictactoe.board.should == [["X","0","X"],["0","-","-"],["X","0","X"]]
	  end

	  it "put two cells in the same place" do
	    @tictactoe.put_cell_at_game(1,1,"X")
	    @tictactoe.put_cell_at_game(1,1,"0")
	    @tictactoe.board.should == [["X","0","-"],["-","X","-"],["X","0","X"]]
	  end

	  it "put a complete game" do
	    @tictactoe.put_cell_at_game(0,2,"X")
	    @tictactoe.put_cell_at_game(1,0,"0")
	    @tictactoe.put_cell_at_game(1,1,"X")
	    @tictactoe.put_cell_at_game(1,2,"0")
	    @tictactoe.board.should == [["X","0","X"],["0","X","0"],["X","0","X"]]
    end
  end


  describe "evaluate the game" do
	  before { @tictactoe.board = [["X","-","-"],["-","-","0"],["-","0","-"]] 
             @tictactoe.turns = 3 }
	
	  it "is there a winner in a row?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_cell_at_game(2,0,"0")
	    @tictactoe.put_cell_at_game(2,2,"0")
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.winner.should == "0"
	  end

	  it "is there a winner in a column?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_cell_at_game(1,0,"X")
	    @tictactoe.put_cell_at_game(2,0,"X")
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.winner.should == "X"
	  end

	  it "is there a winner in diagonal 1?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_cell_at_game(1,1,"X")
	    @tictactoe.put_cell_at_game(2,2,"X")
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.winner.should == "X"
	  end

  	it "is there a winner in diagonal 2?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_cell_at_game(0,2,"0")
	    @tictactoe.put_cell_at_game(1,1,"0")
	    @tictactoe.put_cell_at_game(2,0,"0")
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.winner.should == "0"
	  end
  end


  describe "full board and there is a winner" do
	  before { @tictactoe.board = [["X","0","X"],["0","X","0"],["X","0","X"]]
             @tictactoe.turns = 5 }
	
	  it "the winner is X" do
	    @tictactoe.put_cell_at_game(2,2,"X")
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.tie?.should be_false
	    @tictactoe.winner.should == "X"
	  end
  end


  describe "full board" do
    before { @tictactoe.board = [["X","0","X"],["0","X","0"],["0","X","0"]]
             @tictactoe.turns = 4 }

	  it "there is a tie" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.tie?.should be_true
	    @tictactoe.winner.should == :no_player
	  end

    it "clean the board" do
  	  @tictactoe.clean_the_board
	    @tictactoe.board.should == [["-","-","-"],["-","-","-"],["-","-","-"]]
    end
  end
end
