# frozen_string_literal: true

module Readers
  class HomeController < ReadersController
    def index
      @posts = Post.published.most_recently_published
    end

    def search
      @posts = Post.where('title LIKE ?' + '%' + params[:q] + '%')
    end

    def show; end
  end
end
