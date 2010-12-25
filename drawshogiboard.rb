!# usr/bin/ruby -w
require 'RMagick'

canvas = Magick::ImageList.new
canvas.new_image(270, 270, Magick::HatchFill.new('white', 'black', 30))

chars = ["a", "b", "c", "歩"]

text = Magick::Draw.new
text.pointsize = 29
text.font = '/usr/share/fonts/truetype/ttf-japanese-gothic.ttf'
#text.font_family = 'helvetica'
chars.each_with_index do |c, i|
  x = -120 + i * 30
  y = -120
  text.annotate(canvas, 0, 0, x, y, c) {
    self.gravity = Magick::CenterGravity
    self.rotation = 180 if i == 2
  }
end 
  
canvas.display

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

