#!/usr/bin/env ruby -w

def valid_triangle?(a, b, c)
  a + b > c && b + c > a && a + c > b
end

triangle_count = 0

File.new('day3.in').each_line do |line|
  /\s*(?<a>\d+)\s+(?<b>\d+)\s+(?<c>\d+)/ =~ line
  triangle_count += 1 if valid_triangle?(a.to_i, b.to_i, c.to_i)
end

puts triangle_count
