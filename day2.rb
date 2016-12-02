#!/usr/bin/env ruby -w

keypad = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

x, y = 1, 1

File.new('day2.in').each_line do |line|
  line.chomp.each_char do |move|
    case move
    when 'U'
      x -= 1 unless x.zero?
    when 'D'
      x += 1 unless x == 2
    when 'L'
      y -= 1 unless y.zero?
    when 'R'
      y += 1 unless y == 2
    end
  end
  print keypad[x][y]
end
print "\n"
