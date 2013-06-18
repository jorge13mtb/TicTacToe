
=begin
	Tictactoe Rspec
	By Jorge Chavarria Rodriguez
=end


require 'tictactoe.rb'

describe Tictactoe do

    before do
	@tictactoe = Tictactoe.new
    end

    describe "initialize the tictactie" do
 	it "values of the beginning of the tictactoe game" do
	    @tictactoe.should_not be_nil
	    expect(@tictactoe.board).to eq([["-","-","-"],["-","-","-"],["-","-","-"]])
	end
    end

    describe "to play" do
        before { @tictactoe.board = [["X","0","-"],["-","-","-"],["X","0","X"]] }

	it "put two pieces in different places" do
	    @tictactoe.put_piece_at_game(0,2,"X")
	    @tictactoe.put_piece_at_game(1,0,"0")
	    expect(@tictactoe.board).to eq([["X","0","X"],["0","-","-"],["X","0","X"]])
	end

	it "put two pieces in the same place" do
	    @tictactoe.put_piece_at_game(1,1,"X")
	    @tictactoe.put_piece_at_game(1,1,"0")
	    expect(@tictactoe.board).to eq([["X","0","-"],["-","X","-"],["X","0","X"]])
	end  

	it "put a complete game" do
	    @tictactoe.put_piece_at_game(0,2,"X")
	    @tictactoe.put_piece_at_game(1,0,"0")
	    @tictactoe.put_piece_at_game(1,1,"X")
	    @tictactoe.put_piece_at_game(1,2,"0")
	    expect(@tictactoe.board).to eq([["X","0","X"],["0","X","0"],["X","0","X"]])
        end
    end


    describe "evaluate the game" do
	before { @tictactoe.board = [["X","-","-"],["-","-","0"],["-","-","-"]] }
	
	it "is there a winner in a row?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_piece_at_game(2,0,"0")
	    @tictactoe.put_piece_at_game(2,1,"0")
	    @tictactoe.put_piece_at_game(2,2,"0")
	    @tictactoe.is_there_a_winner?.should be_true
	    expect(@tictactoe.who_is_the_winner?).to eq("0")
	end

	it "is there a winner in a column?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_piece_at_game(1,0,"X")
	    @tictactoe.put_piece_at_game(2,0,"X")
	    @tictactoe.is_there_a_winner?.should be_true
	    expect(@tictactoe.who_is_the_winner?).to eq("X")
	end

	it "is there a winner in diagonal 1?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_piece_at_game(1,1,"X")
	    @tictactoe.put_piece_at_game(2,2,"X")
	    @tictactoe.is_there_a_winner?.should be_true
	    expect(@tictactoe.who_is_the_winner?).to eq("X")
	end

	it "is there a winner in diagonal 2?" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.put_piece_at_game(0,2,"0")
	    @tictactoe.put_piece_at_game(1,1,"0")
	    @tictactoe.put_piece_at_game(2,0,"0")
	    @tictactoe.is_there_a_winner?.should be_true
	    expect(@tictactoe.who_is_the_winner?).to eq("0")
	end
    end


    describe "full board and there is a winner" do
	before { @tictactoe.board = [["X","0","X"],["0","X","0"],["X","0","X"]] }
	
	it "the winner is X" do
	    @tictactoe.is_there_a_winner?.should be_true
	    @tictactoe.is_there_a_tie?.should be_false
	    expect(@tictactoe.who_is_the_winner?).to eq("X")
	end
    end

    describe "full board" do
        before { @tictactoe.board = [["X","0","X"],["0","X","0"],["0","X","0"]] }

	it "there is a tie" do
	    @tictactoe.is_there_a_winner?.should be_false
	    @tictactoe.is_there_a_tie?.should be_true
	    expect(@tictactoe.who_is_the_winner?).to eq(:no_player)
	end

        it "clean the board" do
  	    @tictactoe.clean_the_board
	    expect(@tictactoe.board).to eq([["-","-","-"],["-","-","-"],["-","-","-"]])
        end
    end
end
