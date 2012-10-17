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


tmp_array = []  
array = []

puts "Middle Time #{Time.now - beginning}"

counter = ordered_word.count
while counter > 6
	ordered_word.combination(counter).to_a.each do |el|
		tmp_array << el.sort.join(",").gsub(",", "")
	end
	
	array = EnWord.all(:conditions => ["ordered_word IN (?)", tmp_array.uniq])
	
#	tmp_array.uniq.each do |el2|
#		x = EnWord.all(:ordered_word => el2).first
#		unless x.nil?
#			array << x.word 
#		end
#	end
	counter = counter - 1
end
#words.each do |word|
#  tmp_word = word.word.split(//)
  #array << word.word if is_subset?(ordered_word, tmp_word)
  
#end

puts "After word search: #{Time.now - beginning}"

array = array.uniq.sort_by {|x| x.word.length}

array.each do |el|
  puts el.word
end

puts "Found #{array.count} words. Time elapsed #{Time.now - beginning} seconds"
