load "B.rb"
say()

$LOAD_PATH << '.' #让Ruby知道必须在当前目录中搜索被引用的文件

require "c.rb"
# require 'c'

include C

C::say #C::say()
C.say #C.say()
