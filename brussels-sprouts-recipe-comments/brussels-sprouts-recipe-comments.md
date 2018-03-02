## OMG we need comments on our recipes!

Ok, we are going to need to figure out how to allow people comment on our recipes. Some recipes are going to be more popular than others and will probably get more comments. How are we going to do this?!

### Learning Goals

* Understand database relationships

### Getting Started
```no-highlight
$ et get brussels-sprouts-recipe-comments
$ cd brussels-sprouts-recipe-comments
$ bundle
```

### Instructions

1. Create a PostgreSQL database titled `brussels_sprouts_recipes`.
2. In the `schema.sql` file, write the necessary SQL code to create two tables. Call the first one `recipes` and the second one `comments`. Run `psql brussels_sprouts_recipes < schema.sql` from the command line to load the database schema.
3. Determine the best column names for each of the above tables and create them.
4. You'll see that you've been given a `seeder.rb` that contains recipe titles. We want to add this data to our database. We can do that by writing SQL statements to insert data in the `seeder.rb` file. In that file, you'll need to open the connection to the database, as you learned to do in the `SQL Basics with PostgreSQL and Ruby` lesson, and use SQL insert statements to add data.
5. Once you've written your SQL statements in the `db_connection` in your `seeder.rb`, it's time to get that data into the database! Run `ruby seeder.rb` from the command line to execute the commands you wrote in the `db_connection`.
6. Associate the tables by implementing primary and foreign keys. Ask yourself questions about the relationships between the table to determine these relationships. For example, does a recipe have many comments? Does a comment have many recipes or just one recipe?
7. Create a Markdown file (`something.md`) and write SQL code to answer the following questions:
    * How many recipes are there in total?
    * How many comments are there in total?
    * Add a new recipe titled `Brussels Sprouts with Goat Cheese`. Add two comments to it.
    * How would you find out how many comments each of the recipes have? (Optional)
    * What is the name of the recipe that is associated with a specific comment? (Optional)

### Tips

* Look into the [faker](https://github.com/stympy/faker) to generate arbitrary fake data to use to seed your database tables.
