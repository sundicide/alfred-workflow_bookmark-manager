argvs = ARGV[0]

splitted_argvs = argvs.split

url = splitted_argvs[0]
title = splitted_argvs[1]

require 'sqlite3'
require 'json'

db = SQLite3::Database.open 'bookmarks.sqlite'

begin
  db.execute "INSERT INTO urls (url, title) VALUES (?, ?)", url, title
  print "Success"

rescue Exception => e
  print e

end