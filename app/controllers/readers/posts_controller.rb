# frozen_string_literal: true

module Readers
  class PostsController < ReadersController
    before_action :authenticate_user!
    def show
      @post = Post.published.friendly.find(params[:id])
      @comments = @post.comments.includes(:user, :rich_text_body).order(created_at: :desc)
    end
  end
end
