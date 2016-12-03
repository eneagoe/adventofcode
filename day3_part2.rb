#!/usr/bin/env ruby -w

def valid_triangle?(a, b, c)
  a + b > c && b + c > a && a + c > b
end

triangle_count = 0

File.new('testday3.in').each_slice(3) do |lines|
  triangle_array = []
  lines.each do |line|
    /\s*(?<a>\d+)\s+(?<b>\d+)\s+(?<c>\d+)/ =~ line
    triangle_array << [a.to_i, b.to_i, c.to_i]
  end
  triangle_array.transpose.each do |a, b, c|
    triangle_count += 1 if valid_triangle?(a.to_i, b.to_i, c.to_i)
  end
end

puts triangle_count
