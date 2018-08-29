require 'singleton'
 
class Piece
  attr_accessor :pos
  attr_reader :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos
  end
  
  def to_s
    " "
  end
end


class NullPiece < Piece 
  include Singleton
  
  def initialize
    super(nil, nil, nil)
  end
  
  def moves 
  end
  
  def symbol
  end 
end