#!/usr/bin/env ruby -w

sector_sum = 0
File.new('day4.in').each_line do |line|
  /(?<encrypted>\D+)-(?<sector_id>\d+)\[(?<checksum>\w{5})\]/ =~ line

  real_checksum = encrypted.delete("-").each_char.map { |c| [c, encrypted.count(c)] }.
    uniq.sort_by { |a, b| [-b, a] }.map(&:first).join[0...5]
  sector_sum += sector_id.to_i if checksum == real_checksum
end

puts sector_sum
