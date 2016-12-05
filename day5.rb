#!/usr/bin/env ruby -w

require 'digest/md5'

input = "abbhdwsy"
i = 0
password = ""

while password.size < 8
  str = input + i.to_s
  digest =  Digest::MD5.hexdigest(str)
  if digest[0..4] == '00000'
    password << digest[5]
  end
  i += 1
end

puts password
