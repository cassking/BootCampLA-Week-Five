-- Define the structure of your database, here.
DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
-- Define your schema here:

CREATE TABLE recipes(
  id SERIAL PRIMARY KEY,
  recipe_title VARCHAR(255) NOT NULL
);
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  comment_title VARCHAR(255) NOT NULL,
  recipe_id INTEGER REFERENCES recipes(id)
);
