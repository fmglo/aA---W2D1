require_relative 'piece.rb'
require_relative 'slideable.rb'

class Pawn < Piece
  include Slideable
  
  def to_s
    @color == :W ? "♙" : "♟"
  end
  
  def move_dirs
    ['step']
  end
end