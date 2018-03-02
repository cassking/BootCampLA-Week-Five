### Brussels Sprouts Recipe Blog with Validations

Time to validate our Brussels Sprouts recipes in our blog.

### Set Up Instructions
* `et get ar-validations`
* `bundle install`
* `rake db:create`
* `ruby server.rb`

You should be able to navigate to `localhost:4567` and see a "Hello World" on the page.

### Learning Goals

* Ensure that data stored in records is of valid type
* Examine the effect that enforced datatypes has on our code

### Instructions

Let's create a Brussels Sprouts recipe blog!

##### Validating Our Brussels Sprouts
* Create a migration that will create a table for brussels sprouts `recipes`.
* Each recipe should have a title. It should be unique and should not be null.
* Validate that the title of each recipe contains "brussels sprouts" in it.

##### Commenting On Our Brussels Sprouts
* Create a migration that will create a `comments` table. Each `comment` should belong to a `recipe`.
* The length of a comment should be no more than 140 characters long.

##### Editing Our Recipes
* Whoops! We forgot to include `servings` on our recipe table! Write a migration to add a `servings` column to our `recipes` table.
* The servings column should be optional, but if it is supplied, it should be greater than or equal to 1.

### Outputting our Data
* run `pry -r ./server.rb` to enter a pry session that can access our server.
* You should be able to add recipes and comments in the command line. The recipes should not persist to the database if you put in a recipe that fails your validations.
* Visiting the `/` path should show an index of all of your recipes without comments.
* Visiting the `/recipes/:id` path should bring you to a show page for that recipe and its associated comments.
