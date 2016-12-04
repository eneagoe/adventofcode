#!/usr/bin/env ruby -w

letters = ('a'..'z').to_a

File.new('day4.in').each_line do |line|
  /(?<encrypted>\D+)-(?<sector_id>\d+)/ =~ line

  rotated = letters.map.with_index { |a, i| letters[(i + sector_id.to_i) % letters.size] }
  decrypted = encrypted.gsub(/-/, ' ').tr(letters.join, rotated.join)

  puts decrypted, sector_id if decrypted =~ /north/
end
