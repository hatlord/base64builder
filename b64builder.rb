#!/usr/bin/env ruby
#HTTP basic username:password list builder for HTTP basic auth attacks

require 'base64'

users = ARGV[0]
passwords = ARGV[1]

def buildlist(users, passwords)
  combined = []
  usernames = File.readlines(users).map(&:chomp)
  passwords = File.readlines(passwords).map(&:chomp)

  usernames.each do |user|
    passwords.each do |pass|
      combined << "#{user}:#{pass}"
      end
    end
  combined
end

def encodelist(list)
  base64 = []
  
  list.each { |e| base64 << Base64.encode64(e)}
  File.open("base64out.txt", 'a+') { |f| f.puts base64 }
end

list = buildlist(users, passwords)
encodelist(list)