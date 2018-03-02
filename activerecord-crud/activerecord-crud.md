### Introduction

Web development is heavily dependent on the the creating, reading, updating, and deleting of resources. ActiveRecord acts as an object-layer on top of our SQL database, abstracting us away from the complexity of **S**tructured **Q**uery **L**anguage. Through inheritance, we can utilize the features of ActiveRecord which allow us to perform CRUD actions without the need to write SQL. Let's explore these features of the ActiveRecord library which allow us to perform create, read, update, and delete operations on our data.

### Getting Started

```no-highlight
$ et get activerecord-crud
$ cd activerecord-crud
$ bundle install
$ rake db:create
```

### Create an `Article` model

![Entity-Relationship Diagram for the articles table](https://s3.amazonaws.com/horizon-production/images/erd-articles.png)

```ruby
# app/models/article.rb

class Article < ActiveRecord::Base
end
```

### Create a migration

The following command will create a migration for adding the `articles` table to the database:

```no-highlight
$ rake db:create_migration NAME=create_articles
```

Edit the generated `db/migrate/YYYYMMDDHHMMSS_create_articles.rb` file:

```ruby
# db/migrate/YYYYMMDDHHMMSS_create_articles.rb

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |table|
      table.string :subject, null: false
      table.text :story, null: false

      table.timestamps null: false
    end
  end
end
```

Notice the naming conventions here. The `Article` model is singular, while the `articles` table is plural. Adhering to this naming convention is important, since `ActiveRecord` uses the plural form of the model name to find the associated table in the database. The [`ActiveSupport::Inflector`](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html) class handles the singularization or pluralization of words. Check out the [ActiveRecord Naming Challenge](http://ar-naming.herokuapp.com/) to practice your ability to adhere to `ActiveRecord` naming conventions.

### Update the Database

```no-highlight
$ rake db:create
$ rake db:migrate
```

### Drop into a `pry` session

This tutorial is going to be rather interactive, so let's pop into a `pry` session and load up our app:

```no-highlight
$ pry -r './app.rb'
[1] pry(main)>
```

## Creating

### `.create`

```ruby
article = Article.create(subject: "Google has a new logo", story: "Check it out!")
```

The `create` class method is something we gained by inheriting from `ActiveRecord::Base`. This method saves a record to the database. It takes key/value pairs as arguments, where the keys are the column names on the table, and the values are the values we want to save. Try this out in the `pry` console.

### `.new` and `#save`

Another way to create a record in our database via ActiveRecord is via the `.new` and `#save` methods.

```ruby
funny_cat_video = Article.new
funny_cat_video.subject = "Everybody loves cats"
funny_cat_video.story = "https://www.youtube.com/watch?v=LNWjZcbv2uI#nf"
funny_cat_video.persisted?  # => false
funny_cat_video.save
funny_cat_video.persisted?  # => true
```

The `#persisted?` method tells us if we have actually persisted, or saved, this data to the database. Otherwise, this object will only exist in RAM, for the length of our `pry` session. Calling `#save` on the object executes SQL behind the scenes that actually `INSERT`s the data into the database.

## Reading

For the next section, we need to create more than two records for this exercise to be interesting. Add the following to your `Gemfile`:

```ruby
gem "faker"
```

Run the `bundle` command.

Add `require "faker"` to your `app.rb`.

Run the following code in a `pry` session:

```ruby
1000.times do
  Article.create(
    subject: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    story: Faker::Hacker.say_something_smart
  )
end
```

### `.find`

If we know the id of the record we are looking for, we can use the `.find` method to retrieve it.

```ruby
article = Article.find(25)
```

### `.find_by`

If we want to look up a record by some other property, the `.find_by` method is the way to go.

```ruby
article = Article.find_by(subject: "Everybody loves cats")
```

We can use any column we wish to look up data with the `.find_by` method. What happens if a record does not exist? What happens when there are duplicate records that match?

### `.where`

The `.where` method is very similar to the `.find_by` method, except that it returns a collection of records that match.

```ruby
articles = Article.where(subject: "back-end matrix")
```

### `.order`

We can change the sort order of records that are returned.

```
sorted_articles = Article.order(created_at: :desc)
```

### `.limit` and `.offset`

Typically, we want to limit the number of records we retrieve. If our query were to return millions of records, that could take up all of the RAM on a machine, which would slow down your app and other processes running on it.

```
articles = Article.limit(3)

articles = Article.limit(10).offset(5)
```

Chaining methods allows us to be more specific about the data we would like to retrieve from the database. Try retrieving the last 5 articles that were created.

### `#pluck`

Say, for instance, we want to retrieve only the subject fields of our articles:

```ruby
recent_articles = Article.order(created_at: :desc).limit(10)
subjects = recent_articles.pluck(:subject)
```

The `#pluck` method is a fairly new addition. If you find yourself working with an older version of ActiveRecord, you can achieve the same functionality with the `#map` method.

```ruby
subjects = recent_articles.map(&:subject)
```

## Updating

### Via object properties

```ruby
article = Article.last
article.story = "That's a funny subject!"
article.save
```

### `#update_attributes`

We can change the properties of an ActiveRecord object by using a hash.

```ruby
article_attributes = {
  subject: "Clock Tower Struck By Lightning",
  story: "Clock stopped at 10:04.",
  created_at: Date.parse("1955/11/12")
}
article.update_attributes(article_attributes)
```

## Deleting

### `#delete`

Let's clean up some articles:

```ruby
article = Article.find(1)
article.delete
```

```ruby
articles = Article.where(subject: "optical hard drive")
articles.delete_all
```

We have only scratched the surface of what we can do with ActiveRecord. Remember these basic methods. They will serve you well in the journey ahead.
