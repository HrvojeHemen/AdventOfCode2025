file = File.read "problem4/input.txt"

def count_neighbours(matrix, row, col)
  count = 0
  ((row - 1)..(row + 1)).each { |i|
    ((col - 1)..(col + 1)).each { |j|
      if i >= 0 && i < matrix.length && j >= 0 && j < matrix[0].length && (i != row || j != col) && matrix[i][j] == '@'
        count += 1
      end
    }
  }
  count
end

matrix = file.split("\n").map{|line| line.chars}

accessible = 0
found = true

while found
  found = false
  neighbour_count_matrix = Array.new(matrix.length) { Array.new(matrix[0].length, -1) }
  ((0)..(matrix.length - 1)).each do |i|
    row = matrix[i]
    ((0)..(row.length)).each do |j|
      if row[j] == '@'
        neighbour_count_matrix[i][j] = count_neighbours(matrix, i, j)
      end
    end
  end

  neighbour_count_matrix.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if 0 <= cell && cell < 4
        accessible += 1
        matrix[i][j] = '.'
        found = true
      end
    end
  end
end



puts accessible


