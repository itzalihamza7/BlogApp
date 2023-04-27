# frozen_string_literal: true

module Authors
  class PostsController < UsersController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :set_post, only: %i[edit update destroy]
    before_action :authorize_post, only: %i[edit update destroy]

    def index
      @posts = current_user.Moderator? ? Post.all : current_user.posts
    end

    def new
      @post = current_user.posts.build
    end

    def edit
      @element = @post.elements.build
    end

    def create
      @post = current_user.posts.build(post_params)

      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to edit_authors_post_path(@post)
      else
        flash[:alert] = 'Post not created Title is empty or Description is too short'
        redirect_to new_authors_post_path
      end
    end

    def update
      if @post.update(post_params)
        flash[:notice] = 'Post was successfully updated'
      else
        flash[:alert] = 'Post not updated Title is empty or Description is too short'
      end
      redirect_to edit_authors_post_path(@post)
    end

    def destroy
      @post.destroy
      if @post.destroyed?
        flash[:notice] = 'Post was successfully destroyed'
      else
        flash[:alert] = 'Post not destroyed'
      end
      redirect_to authors_posts_path
    end

    private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def authorize_post
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :description, :header_image)
    end
  end
end
