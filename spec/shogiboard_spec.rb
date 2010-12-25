!# /usr/bin/ruby

require "shogiboard"

describe ShogiBoard do
  it "draw on board" do
    shogi_board = ShogiBoard.new
    shogi_board.draw
  end
end

