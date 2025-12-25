file = File.read "problem7/input.txt"
# file = File.read "problem7/input_basic.txt"
lines = file.lines.map { |line| line.strip}
number_of_visit_ways = lines.map { |line| line.split('').map { |c|
  if c == 'S'
    1
  else
    0
  end
} }

tachyon_counter = 0
split_counter = 0
(1..(lines.length - 1)).each do |i|
  previous_line = lines[i-1]
  current_line = lines[i]
  (0...(current_line.length)).each do |j|
    previous_line_char = previous_line[j]
    current_line_char = current_line[j]

    if previous_line_char == '.'
      next
    end

    if current_line_char == '.' && (previous_line_char == '|' || previous_line_char == 'S')
      current_line[j] = '|'
      number_of_visit_ways[i][j] += number_of_visit_ways[i-1][j]
      next
    end

    if current_line_char == '|'
      number_of_visit_ways[i][j] += number_of_visit_ways[i-1][j]
      next
    end

    if previous_line_char == '^'
      next
    end

    left_index = j - 1
    right_index = j + 1

    tachyon_counter += 1
    if left_index >= 0
      current_line[left_index] = '|'
      number_of_visit_ways[i][left_index] += number_of_visit_ways[i-1][j]
    end

    if right_index < current_line.length
      current_line[right_index] = '|'
      number_of_visit_ways[i][right_index] += number_of_visit_ways[i-1][j]
    end
  end
end

puts "Problem1 #{tachyon_counter}"
puts "Problem2 #{number_of_visit_ways[-1].sum}"
