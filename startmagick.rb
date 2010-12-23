require 'RMagick'
include Magick

icon = ImageList.new("/home/myokoym/myicon.png")
smallicon = icon.minify
smallicon.display
smallicon.write("smallicon.gif")
exit

