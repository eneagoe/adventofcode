#!/usr/bin/env ruby -w

keypad = [[0, 0, 1, 0, 0],
          [0, 2, 3, 4, 0],
          [5, 6, 7, 8, 9],
          [0, 'A', 'B', 'C', 0],
          [0, 0, 'D', 0, 0]]

x, y = 2, 0

File.new('day2.in').each_line do |line|
  line.chomp.each_char do |move|
    case move
    when 'U'
      x -= 1 unless x.zero? || keypad[x - 1][y] == 0
    when 'D'
      x += 1 unless x == 4 || keypad[x + 1][y] == 0
    when 'L'
      y -= 1 unless y.zero? || keypad[x][y - 1] == 0
    when 'R'
      y += 1 unless y == 4 || keypad[x][y + 1] == 0
    end
  end
  print keypad[x][y]
end
print "\n"
