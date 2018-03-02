# Recipe.create()
Recipe.delete_all
Comment.delete_all

r1 = Recipe.create( title: "Brussel Sprouts Quiche Sandwich", body: "This recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to make")

r2 = Recipe.create(title: "Brussel Sprouts Soup", body: "This recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to make")

r3 = Recipe.create(title: "Brussel Sprouts Puree", body: "This recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to makeThis recipe is very easy to make")

c1 = Comment.create(title: "my comment", body: "so good so good so good so good so good so good ", recipe: r1)

c2 = Comment.create(title: "my  2 comment", body: "very saucy good so good ", recipe:r1)

c3 = Comment.create(title: "my 3 comment", body: "very dry not so good  not so good ", recipe:r2)
