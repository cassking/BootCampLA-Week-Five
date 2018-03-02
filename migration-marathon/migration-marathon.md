#### Getting Started

This exercise is designed to take you through a series of migration steps as the
requirements of your app changes. You should write and run a migration for each
step of the journey.

```no-highlight
$ et get migration-marathon
$ cd migration-marathon
$ bundle install
$ rake db:create
```

#### Step 1

Today we're going to build a library app, and we're ready for our first table. Let's create a `Book` model in `app/models/book.rb`:

```ruby
class Book < ActiveRecord::Base
end
```

Now that we have the model we'll also want to create a migration to add the
corresponding table:

```bash
$ rake db:create_migration NAME=create_books
```

You should see in the output that this generated a migration file in the
`db/migrate` directory. Add an attribute to represent a book title. Add model constraints (validations)
to match your schema constraints (the constraints specified in your migration).

Run the migration:

```no-highlight
rake db:migrate && rake db:rollback && rake db:migrate
```

#### Step 2

Oh no! We forgot to add a column for the author. Create a migration to fix that:

```bash
$ rake db:create_migration NAME=add_author_to_books
```

#### Step 3

Let's add the ability to track which books are staff favorites. Create a
migration to add the boolean `favorite` field.

#### Step 4

Hmmm...favoriting is not enough! Let's add a rating column to store the results
of our recent book poll. The scale goes 0-100.

The rating is optional, but should be numeric if specified.

Before moving on, open a Pry session and add a few `Book` records:

```no-highlight
$ pry -r './app.rb'

> Book.create!(title: 'Catch-22', author: 'Joseph Heller', rating: 100, favorite: true)
 ...
```

#### Step 5

The staff has grown tired of the favorites. Let's remove that column.

*Extra Challenge:* Consider modifying the new migration to use ActiveRecord's [`up`/`down` methods](http://edgeguides.rubyonrails.org/active_record_migrations.html#using-the-up-down-methods) (to `remove_column` and `add_column`).


#### Step 6

Readers show up! Let's check them out some books. Create a new model `Checkout`
with the fields you think it should have, along with its associated `checkouts`
table.

Don't forget the foreign key `book_id`! We need it because each
`Checkout` `belongs_to` a `Book`. Make sure you include the proper associations
in the `Book` and `Checkout` models.

Add a few `Checkout` records in the Pry console.

#### Step 7

Add a `Category` model and `categories` table. The name of the category is
required and must be unique.

Add a few `Category` records in the Pry  console.

#### Step 8

Because more than one book can have the same category and each book can have
more than one category, we need a join table here.  Let's call it
`categorizations`.  It needs two columns, `book_id` and
`category_id`. Make sure you have the proper associations in your
`Category` and `Book` models.

#### Optional Steps

If you have time, the following steps will flesh out our `Category` model and turn our original one-to-many relationship into a many-to-many relationship.

#### Step 9

Let's add a `Reader` model and its associated table. Readers should have a full
name, email, and phone number.

Add a few `Reader` records in the Pry console. Make sure to include records for
every person present in your `checkouts` table.

#### Step 10

Since we now have a `readers` table, we can normalize our `checkouts` table to
refer to a reader's foreign key instead of their name.

Add the proper associations to the `Book`, `Checkout` and `Reader` models. Then generate
a migration to add and populate a foreign key field on the `checkouts` table.

#### Step 11

Confirm that the prior step was successful. If it was, create a migration to
delete the reader's name from the `checkouts` table and run it.

#### Step 12

Instead of tracking readers' full names, we now want separate first and last
name fields in our `readers` table. Write a migration to create and populate
first and last name fields.

#### Step 13

Confirm that the prior step was successful. If it was, create a migration to
delete the reader's full name from the `readers` table and run it.
