web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
worker: sidekiq
webpacker: ./bin/webpack-dev-server
release: bin/rails db:migrate
