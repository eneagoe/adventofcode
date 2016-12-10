#!/usr/bin/env ruby -w

require 'set'

$output = []
$bots = []
$watch = Set.new([17, 61])

Move = Struct.new(:position, :type, :destination) do
  def execute(bot)
    value = bot.send(position)
    bot.remove(value)
    if type == 'bot'
      $bots[destination] ||= Bot.new(destination, Set.new, [])
      $bots[destination] << value
    else
      $output[destination] = value
    end
  end
end

Bot = Struct.new(:identity, :chips, :command_queue) do
  def <<(value)
    chips << value
    puts identity if $watch == chips
  end

  def process_command_queue
    return if command_queue.empty?
    2.times do
      command = command_queue.shift
      command.execute(self)
    end
  end

  def low
    chips.min
  end

  def high
    chips.max
  end

  def remove(val)
    chips.delete(val)
  end

  def full?
    chips.size == 2
  end
end

File.read('day10.in').each_line do |line|
  case line.chomp
  when /value\s+(\d+)\s+goes\s+to\s+bot\s+(\d+)/
    $bots[$2.to_i] ||= Bot.new($2.to_i, Set.new, [])
    $bots[$2.to_i] << $1.to_i
  when /bot\s+(\d+)\s+gives\s+low\s+to\s+(bot|output)\s+(\d+)\s+and\s+high\s+to\s+(bot|output)\s+(\d+)/
    $bots[$1.to_i] ||= Bot.new($1.to_i, Set.new, [])
    $bots[$1.to_i].command_queue << Move.new(:low, $2, $3.to_i)
    $bots[$1.to_i].command_queue << Move.new(:high, $4, $5.to_i)
  end
end

while $bots.any?(&:full?)
  $bots.each do |bot|
    bot.process_command_queue if bot && bot.full?
  end
end

puts $output[0..2].reduce(:*)
