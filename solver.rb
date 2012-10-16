# encoding: UTF-8

beginning = Time.now

require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  encoding: "utf8",
  database: "wordmatch",
  username: "root",
  password: "yourpass"
  #socket: "/tmp/mysql.sock"
)

class GrWord < ActiveRecord::Base
end

class EnWord < ActiveRecord::Base
end


ordered_word = ARGV[0].upcase.chars.sort.join.split(//)
words = EnWord.select(:word) #.limit(200)

def is_subset?(a,b)
  !a.find{|x| a.count(x) > b.count(x)}
end
  
array = []

puts "Middle Time #{Time.now - beginning}"


words.each do |word|
  tmp_word = word.word.split(//)
  array << word.word if is_subset?(ordered_word, tmp_word)
end

puts "After word search: #{Time.now - beginning}"

array.each do |el|
  puts el
end

puts "Found #{array.count} words. Time elapsed #{Time.now - beginning} seconds"
