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


  
array = []

puts "Middle Time #{Time.now - beginning}"

counter = ordered_word.count
while counter > 1
	ordered_word.combination(counter).to_a.each do |el|
		x = EnWord.where(:ordered_word => el.sort.join(",").gsub(",", "")).first
		unless x.nil?
			array << x.word 
		end
	end
	counter = counter - 1
end
#words.each do |word|
#  tmp_word = word.word.split(//)
  #array << word.word if is_subset?(ordered_word, tmp_word)
  
#end

puts "After word search: #{Time.now - beginning}"


array.reverse.uniq.each do |el|
  puts el
end

puts "Found #{array.count} words. Time elapsed #{Time.now - beginning} seconds"
