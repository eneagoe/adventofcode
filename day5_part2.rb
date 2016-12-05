#!/usr/bin/env ruby -w

require 'digest/md5'

input = 'abbhdwsy'
i = 0
password = '_' * 8

while password.include?('_')
  str = input + i.to_s
  digest =  Digest::MD5.hexdigest(str)
  if digest[0..4] == '00000'
    position = digest[5]
    password[position.to_i] = digest[6] if ('0'..'7').include?(position) && password[position.to_i] == '_'
  end
  i += 1
end

puts password
