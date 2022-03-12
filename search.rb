query = ARGV[0]

require 'sqlite3'
require 'json'

db = SQLite3::Database.open 'bookmarks.sqlite'
db.results_as_hash = true

select_query = "SELECT * FROM urls WHERE title LIKE '%" + query.to_s + "%' OR url LIKE '%" + query.to_s + "%';"

results = db.execute(select_query)

if results.empty?
  print JSON.generate({"items": [
    {
      "title": "No Results"
    }
  ]})
else
  revised_results = results.map { |ob| {
      "type": "file",
      "title": ob['title'],
      "subtitle": ob['url'],
      "arg": ob['url']
    }
  }
  print JSON.generate({"items": revised_results})
end