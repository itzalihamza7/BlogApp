# BlogApp

A publishing platform built with Ruby on Rails where authors write rich posts, readers comment, like, report and suggest edits, and moderators control what gets published. Post editing updates live in the browser with StimulusReflex.

## Features

- **Roles:** Author, Moderator and Admin, with Devise authentication and Pundit authorization
- **Writing:** authors build posts from reorderable content elements (rich text with Action Text, drag-and-drop ordering) that update live without page reloads
- **Reading:** readers comment on posts, like them and suggest improvements to the author
- **Moderation:** users report posts; moderators publish, unpublish or delete them; admins manage everything in RailsAdmin at `/admin`
- **Stats:** per-post view tracking with charts for authors
- **Friendly URLs** for posts and users

## Tech stack

Ruby 2.7.1 · Rails 5.2 · PostgreSQL · StimulusReflex + Action Cable (Redis) · Stimulus · Action Text · Devise · Pundit · RailsAdmin · Active Storage · Chart.js · Bootstrap · RSpec

## Getting started

Requires Ruby 2.7.1, PostgreSQL, Redis, Node.js and Yarn.

```bash
bundle install
yarn install
bin/rails db:create db:migrate
bin/rails server
```

Redis must be running for live updates (`REDIS_URL` defaults to `redis://localhost:6379/1`). The committed `config/credentials.yml.enc` needs a `master.key` that is not in the repository, so delete it and create your own with `bin/rails credentials:edit` if the app asks for one. Email confirmations need SMTP settings in `config/environments/`.

Run the tests with:

```bash
bundle exec rspec
```

## Project structure

```
app/controllers/readers/   Reading, comments and suggestions
app/controllers/authors/   Writing posts, content elements and stats
app/reflexes/              StimulusReflex handlers for live editing and publishing
app/models/                User, Post, Element, Comment, Like, Report, Suggestion
spec/                      Model and request specs with factories
```
