!# /usr/bin/ruby -w
require 'RMagick'

class ShogiBoard
  FU = "歩"
  KYO = "香"
  KEI = "桂"
  GIN = "銀"
  KIN = "金"
  KAKU = "角"
  HI = "飛"
  GYOKU = "玉"
  TO = "と"
  NARI_KYO = "杏"
  NARI_KEI = "圭"
  NARI_GIN = "全"
  UMA = "馬"
  RYU = "龍"
  def initialize
    @status_onboard = [[[KYO, true], [KEI, true], [GIN, true], [KIN, true], [GYOKU, true], [KIN, true], [GIN, true], [KEI, true], [KYO, true]],
                       [nil, [HI, true], nil, nil, nil, nil, nil, [KAKU, true], nil],
                       [[FU, true], [FU, true], [FU, true], [FU, true], [FU, true], [FU, true], [FU, true], [FU, true], [FU, true]],
                       [nil, nil, nil, nil, nil, nil, nil, nil, nil], 
                       [nil, nil, nil, nil, nil, nil, nil, nil, nil], 
                       [nil, nil, nil, nil, nil, nil, nil, nil, nil], 
                       [[FU, false], [FU, false], [FU, false], [FU, false], [FU, false], [FU, false], [FU, false], [FU, false], [FU, false]],
                       [nil, [KAKU, false], nil, nil, nil, nil, nil, [HI, false], nil],
                       [[KYO, false], [KEI, false], [GIN, false], [KIN, false], [GYOKU, false], [KIN, false], [GIN, false], [KEI, false], [KYO, false]]]
  end
  
  def draw
    canvas = Magick::ImageList.new
    canvas.new_image(270, 270, Magick::HatchFill.new('white', 'black', 30))
    
    text = Magick::Draw.new
    text.pointsize = 29
    @status_onboard.each_with_index do |row_pieces, y_index|
    text.font = '/usr/share/fonts/truetype/ttf-japanese-gothic.ttf'
      row_pieces.each_with_index do |piece, x_index|
        if piece
          x = -120 + x_index * 30
          y = -120 + y_index * 30
          text.annotate(canvas, 0, 0, x, y, piece[0]) {
            self.gravity = Magick::CenterGravity
            if piece[1]
              self.rotation = 180
              self.font_weight = Magick::BoldWeight
            end
          }
        end
      end 
    end  
    canvas.display
  end
end

