#!/usr/bin/env ruby -w

direction = {}
direction[[[0, 1], "R"]] = [1, 0]
direction[[[0, 1], "L"]] = [-1, 0]

direction[[[1, 0], "R"]] = [0, -1]
direction[[[1, 0], "L"]] = [0, 1]

direction[[[0, -1], "R"]] = [-1, 0]
direction[[[0, -1], "L"]] = [1, 0]

direction[[[-1, 0], "R"]] = [0, 1]
direction[[[-1, 0], "L"]] = [0, -1]

visited = []

position = [0, 0]
hq = nil
current_direction = [0, 1]

steps = File.read('day1.in').chomp.split(/,\s+/)
steps.each do |step|
  step =~ /(.)(\d+)/
  current_direction = direction[[current_direction, $1]]
  count = Integer($2)
  count.times do
    position = [position[0] + current_direction[0],
                position[1] + current_direction[1]]
    hq = position if visited.include?(position) && hq.nil?
    visited << position
  end
end

distance = position[0].abs + position[1].abs
hq_distance = hq[0].abs + hq[1].abs if hq
puts "Total distance #{distance}"
puts "HQ at distance #{hq_distance}" if hq
