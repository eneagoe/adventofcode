#!/usr/bin/env ruby -w

count = File.open('day7.in').count do |line|
  match = false
  insides = line.chomp.scan(/\[[^\[\]]+\]/)
  line.chomp.split(/\[[^\[\]]*\]/).each do |seq|
    seq.scan(/(?=((\w)(?!\2)\w\2))/).each do |aba, _|
      a, b = aba[0], aba[1]
      match = true if insides.any? { |inside| /#{b}#{a}#{b}/ =~ inside }
    end
  end
  match
end

puts count
