file = File.read "problem6/input.txt"

lines = file.lines.map { |line|
  line.strip.split ' '
}

total_sum = 0
rows_count = lines.length
columns_count = lines[0].length


(0...columns_count).each { |column|
  op = lines[rows_count-1][column]
  multiply = op == '*'
  initial_num = multiply ? 1 : 0
  (0...rows_count - 1).each { |row|
    num = lines[row][column].to_i
    if multiply
      initial_num = initial_num * num
    else
      initial_num = initial_num + num
    end
  }
  total_sum += initial_num
}
puts "Part1 #{total_sum}"


def get_result(numbers, op)
    if numbers.length == 0
      return 0
    end

    multiply = op == '*'
    initial_num = multiply ? 1 : 0
    numbers.each { |num|
      if multiply
        initial_num = initial_num * num
      else
        initial_num = initial_num + num
      end
    }

    initial_num
end

lines = file.lines.map { |line|
  line
}

total_sum = 0
rows_count = lines.length
columns_count = lines[0].length

numbers = []
op = ''
(0...columns_count).each { |column|
  new_op = lines[rows_count-1][column]
  num = ""
  (0...(rows_count-1)).each { |row|
    num += lines[row][column]
  }

  unless new_op == ' '
    res = get_result(numbers, op)
    numbers = []
    total_sum += res
    op = new_op
  end

  if num.strip != ""
    numbers.push num.strip.to_i
  end

}

puts "Part2 #{total_sum}"





