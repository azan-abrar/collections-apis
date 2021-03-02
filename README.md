# INSTRUCTIONS

* Dependencies
- Ruby          v2.6.6
- Rails         v5.2.3
- Postgres      v12.6
- ElasticSearch v7.10.2

* Setup
- Clone the project.
- Copy database.example.yml to build your database.yml.
- Run command `rvm use 2.6.6`
- Run command `bundle install`
- Run command `rake db:create db:migrate`

* APIs
- Check `app/controllers/api` to see available API endpoints.
