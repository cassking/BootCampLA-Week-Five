## Getting Started

```no-highlight
# Install all the gems
bundle install

# Remove the old git history and start your own
rm -rf .git && git init && git add -A && git commit -m 'Initial commit'

# create database by renaming `config/database.example.yml` to `config/database.yml`
rake db:create
rake db:migrate
rake db:test:prepare

# see the tests fail and let them guide your code
rake
```
