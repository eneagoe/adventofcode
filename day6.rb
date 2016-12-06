#!/usr/bin/env ruby -w

lines = File.open('day6.in').readlines
puts lines.map { |line| line.chomp.split(//) }.transpose.map { |line| line.sort_by { |c| line.count(c) }.last }.join

