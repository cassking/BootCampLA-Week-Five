require "pg"

TITLES = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"
]
COMMENTS = [
  "Tasted so bad",
  "It was good",
  "I did not like it",
  "We had lots of these",
  "The dip was cold",
  "It was delicious",
  "Easy to make",
  "It was smoky",
  "It was sweet",
  "it was delish",
  "Very nutty"
]

# Write code to seed your database, here
def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

TITLES.each do | recipe |
  titles_query = "INSERT INTO recipes (recipe_title) VALUES ('#{recipe}')"
  db_connection do |conn|
    conn.exec(titles_query);
  end
end


COMMENTS.each do | comment |
  comments_query = "INSERT INTO comments (comment_title) VALUES ('#{comment}')"
  db_connection do |conn|
    conn.exec(comments_query);
  end
end
