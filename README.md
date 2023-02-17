Blog App

System dependencies

- Ruby version
  ~ 2.7.1p83

- Rails version
  ~ 5.2

- Postgres version
  ~ 14.1

Features

- user can signin/signup
- user can upload posts
- user can report posts
- user can give suggestions to other's posts
- user can give comments to other's posts
- user can edit, delete,like posts
- user can be normal user, moderator, or admin
- moderator has authority to publish unpublish or delete the post.
- admin can manage everything from AdminPanel

Configuration

- add smpt mailer configurations for email confirmations

Database creation

- run rails db:create to create pg database

Database initialization

- run rails db:migrate to initialize database
