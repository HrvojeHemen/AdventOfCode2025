require 'set'

file = File.read "problem5/input.txt"

class Pair
  include Comparable
  def initialize(first, second)
    @first = first
    @second = second
  end

  def first
    @first
  end

  def second
    @second
  end

  def <=>(other)
    @first <=> other.first
  end

  def to_s
    "#{@first} #{@second}"
  end
end

ranges = []
ingredients = []

file.each_line do |line|
  if line.include? "-"
    ranges.push Pair.new(line.split("-")[0].to_i, line.split("-")[1].to_i)
  elsif line.strip != ""
    ingredients.push line.strip.to_i
  end
end

total_good = 0

ingredients.each { |ingredient|
  good = false
  ranges.each { |range|
    if ingredient >= range.first && ingredient <= range.second
      good = true
      break
    end
  }
  if good
    total_good += 1
  end
}

puts "Part1 #{total_good}"




db_good = []

ranges = ranges.sort

i = 0
while i < ranges.length
  puts "Range #{i}"
  current_range = ranges[i]
  
  while i < ranges.length - 1
    next_range = ranges[i + 1]
    if current_range.second >= next_range.first && current_range.second <= next_range.second || next_range.second >= current_range.first && next_range.second <= current_range.second
      current_range = Pair.new(current_range.first, [current_range.second, next_range.second].max)
      i += 1
    else
      break
    end
  end
  
  db_good.push current_range
  i += 1
end

total_sum = 0
db_good.each { |range|
  total_sum += range.second - range.first + 1
}
puts total_sum


