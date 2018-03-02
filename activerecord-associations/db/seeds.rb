# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
cat_article = Article.create(subject: "Some thoughts about cats", story: "They're OK.")
ruby_article = Article.create(subject: 'Ruby vs. Python', story: 'Ruby wins cause I said so.')

Comment.create(body: 'LOL', article_id: cat_article)
Comment.create(body: 'click here for a free iPad!', article_id: cat_article)

Comment.create(body: 'great analysis!!!', article_id: ruby_article)
Comment.create(body: 'ruby is so 2010, Go is the future', article_id: ruby_article)
Comment.create(body: 'i like ice cream', article_id: ruby_article)
