# INSTRUCTIONS

## Dependencies
- Ruby          v2.6.6
- Rails         v5.2.3
- Postgres      v12.6
- ElasticSearch v7.10.2

## Setup
- Clone the project.
- Copy database.example.yml to build your database.yml.
- Run command `rvm use 2.6.6`
- Run command `bundle install`
- Run command `rake db:create db:migrate db:seed`

## APIs
- Check `app/controllers/api` to see available API endpoints.

## Opro & Devise - Oauth2 Setup
- To create user: `http://localhost:3000/sign_up`
- To Create An OAuth Client Application: `http://localhost:3000/oauth_client_apps/new`
- Read complete docs for Opro here: `http://localhost:3000/oauth_docs`
