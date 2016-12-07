#!/usr/bin/env ruby -w

count = File.open('day7.in').count do |line|
  /(\w)(?!\1)(\w)\2\1/ =~ line && /\[[^\]]*(\w)(?!\1)(\w)\2\1[^\[]*\]/ !~ line
end

puts count
