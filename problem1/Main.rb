at_zero = 0
angle = 50
file = File.read("problem1/input.txt")

file.each_line do |line|
  left = line[0] == 'L'
  rotation = line[1, line.length - 1].to_i

  rotation.times do
    angle = left ? (angle - 1) % 100 : (angle + 1) % 100
    at_zero += 1 if angle == 0
  end

end

puts at_zero