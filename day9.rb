#!/usr/bin/env ruby -w

File.read('day9.in').each_line do |line|
  line.chomp!
  decoded_line = ''
  while line =~ /\(((\d+)x(\d+))\)/
    decoded_line << $`
    decoded_line << $'[0...$2.to_i] * $3.to_i
    line = $'[$2.to_i..-1]
  end
  decoded_line << line

  puts decoded_line.size
end
