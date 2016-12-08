#!/usr/bin/env ruby -w

def print_screen(screen, screen_x, screen_y)
  (0...screen_y).each do |y|
    (0...screen_x).each do |x|
      print screen[y][x]
    end
    print "\n"
  end
end

screen_x, screen_y = 50, 6
screen = []
screen_y.times { screen << Array.new(screen_x, ' ') }

File.open('day8.in').each do |line|
  case line
  when /rect\s+(\d+)x(\d+)/
    (0...$1.to_i).each { |x| (0...$2.to_i).each { |y| screen[y][x] = 'o' } }
  when /rotate\s+column\s+x=(\d+)\s+by\s+(\d+)/
    column = $1.to_i
    rotation = $2.to_i
    pixel_col = (0...screen_y).map { |y| screen[y][column] }
    (0...screen_y).each do |i|
      screen[(i + rotation) % screen_y][column] = pixel_col[i]
    end
  when /rotate\s+row\s+y=(\d+)\s+by\s+(\d+)/
    row = $1.to_i
    rotation = $2.to_i
    pixel_row = (0...screen_x).map { |x| screen[row][x] }
    (0...screen_x).each do |i|
      screen[row][(i + rotation) % screen_x] = pixel_row[i]
    end
  end
end

print_screen(screen, screen_x, screen_y)
puts
puts screen.flatten.count('o')
