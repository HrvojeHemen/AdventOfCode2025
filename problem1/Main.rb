at_zero = 0
angle = 50
file = File.read("problem1/input.txt")

file.each_line do |line|
  left = line[0] == 'L'
  rotation = line[1, line.length - 1].to_i

  if left
    angle -= rotation
  else
    angle += rotation
  end

  while angle < 0
    angle += 100
  end

  while angle >= 100
    angle -= 100
  end

  if angle == 0
    at_zero += 1
  end

end

puts at_zero