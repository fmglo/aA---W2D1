require_relative 'piece.rb'
require_relative 'cursor.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new(8) { Array.new(8) {NullPiece.instance} }
    populate_board
  end
  
  def populate_board
    self[[7,0]] = Rook.new(:W, self, [7,0])
    self[[7,1]] = Bishop.new(:W, self, [7,1])
    self[[7,2]] = Knight.new(:W, self, [7,2])
    self[[7,3]] = King.new(:W, self, [7,3])
    self[[7,4]] = Queen.new(:W, self, [7,4])
    self[[7,5]] = Knight.new(:W, self, [7,5])
    self[[7,6]] = Bishop.new(:W, self, [7,6])
    self[[7,7]] = Rook.new(:W, self, [7,7])
     
    self[[6,0]]  = Pawn.new(:W, self, [6,0])
    self[[6,1]]  = Pawn.new(:W, self, [6,1])
    self[[6,2]]  = Pawn.new(:W, self, [6,2])
    self[[6,3]]  = Pawn.new(:W, self, [6,3])
    self[[6,4]]  = Pawn.new(:W, self, [6,4])
    self[[6,5]]  = Pawn.new(:W, self, [6,5])
    self[[6,6]]  = Pawn.new(:W, self, [6,6])
    self[[6,7]]  = Pawn.new(:W, self, [6,7])
     
    
    self[[1,0]]  = Pawn.new(:B, self, [1,0])
    self[[1,1]]  = Pawn.new(:B, self, [1,1])
    self[[1,2]]  = Pawn.new(:B, self, [1,2])
    self[[1,3]]  = Pawn.new(:B, self, [1,3])
    self[[1,4]]  = Pawn.new(:B, self, [1,4])
    self[[1,5]]  = Pawn.new(:B, self, [1,5])
    self[[1,6]]  = Pawn.new(:B, self, [1,6])
    self[[1,7]]  = Pawn.new(:B, self, [1,7])
     
    self[[0,0]] = Rook.new(:B, self, [0,0])
    self[[0,1]] = Bishop.new(:B, self, [0,1])
    self[[0,2]] = Knight.new(:B, self, [0,2])
    self[[0,3]] = King.new(:B, self, [0,3])
    self[[0,4]] = Queen.new(:B, self, [0,4])
    self[[0,5]] = Knight.new(:B, self, [0,5])
    self[[0,6]] = Bishop.new(:B, self, [0,6])
    self[[0,7]] = Rook.new(:B, self, [0,7])
  end
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end 
  
  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end 
  
  def move_piece(color, star_pos, end_pos)
      if self[star_pos] == NullPiece.instance
        raise "You can't move that piece"
      else
        pieceA = self[star_pos]
      end

    
    if self[end_pos].color == pieceA.color
      raise "You can't eat your own piece"
    else
      pieceB = self[end_pos]
      self[star_pos], self[end_pos] = NullPiece.instance, pieceA
      pieceA.pos = end_pos
      pieceB.pos = nil
    end
    
    @rows     
  end 
  
  def valid_pos?(pos)
    pos.all? {|idx| idx >= 0 && idx <= 7}
  end 
  
  def add_piece(piece, pos)
    @rows[pos] = piece
  end 
  
  def checkmate?(color)
  end 
  
  def in_check?(color)
  end 
  
  def find_king(color)
  end 
  
  def pieces
  end 
  
  def dup
  end 
  
  def move_piece!(color, start_pos, end_pos)
    
  end 
  
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
end 
