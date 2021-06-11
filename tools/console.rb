require_relative '../config/environment.rb'
a1 = Artist.new("abc", 3)
a2 = Artist.new("porblems", 5)
a3 = Artist.new("output", 1)

gallery1 = Gallery.new("terminal", "NH")
gallery2 = Gallery.new("comments", "BJ")

p1 = a1.create_painting("debug", 100000, gallery1)
p2 = a1.create_painting("console", 123, gallery1)
p3 = a1.create_painting("zsh", 432, gallery2)
p4 = a2.create_painting("shared", 1023, gallery2)
p5 = a3.create_painting("local", 908, gallery1)






binding.pry

puts "Bob Ross rules."
