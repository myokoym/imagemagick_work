!# usr/bin/ruby -w
require 'RMagick'

class ShogiBoard
  def draw(pieces)
    canvas = Magick::ImageList.new
    canvas.new_image(270, 270, Magick::HatchFill.new('white', 'black', 30))
    
    text = Magick::Draw.new
    text.pointsize = 29
    text.font = '/usr/share/fonts/truetype/ttf-japanese-gothic.ttf'
    pieces.each_with_index do |row_pieces, y_index|
      row_pieces.each_with_index do |piece, x_index|
        x = -120 + x_index * 30
        y = -120 + y_index * 30
        text.annotate(canvas, 0, 0, x, y, piece) {
          self.rotation = 180 if x_index == 2
          self.gravity = Magick::CenterGravity
        }
      end 
    end  
    canvas.display
  end
end

shogi_board = ShogiBoard.new
shogi_board.draw([["a", "b", "c", "歩"]])
 
__END__
circle = Magick::Draw.new
circle.stroke('tomato')
circle.fill_opacity(0)
circle.stroke_width(6)
circle.stroke_linecap('round')
circle.stroke_linejoin('round')
circle.ellipse(canvas.rows/2,canvas.columns/2, 80, 80, 0, 315)
circle.polyline(180,70, 173,78, 190,78, 191,62)
circle.draw(canvas)

canvas.display

