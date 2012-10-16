# encoding: UTF-8


require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  encoding: "utf8",
  database: "wordmatch",
  username: "root",
  password: "yourpass",
  #socket: "/tmp/mysql.sock"
)

class GrWord < ActiveRecord::Base
end

class EnWord < ActiveRecord::Base
end




def add_to_database_gr
  file = File.new("el-GR.dic", "r")
  while(line = file.gets)
    GrWord.create(word: line, ordered_word: word_order(line))
    # p word_order(line)
  end
  file.close
end

def add_to_database_en
  file = File.new("en-US.dic", "r")
  while(line = file.gets)
    EnWord.create(word: line, ordered_word: word_order(line))
  end
  file.close
end

def word_order(word)
   ordered_word = word.chars.sort.join.gsub("\n", "")
   return ordered_word
end


add_to_database_en
#puts "test"
