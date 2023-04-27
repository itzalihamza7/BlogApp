# frozen_string_literal: true

module Readers
  class CommentsController < UsersController
    before_action :authenticate_user!
    before_action :set_post
    before_action :authorize, only: %i[update destroy]

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
      else
        flash[:alert] = 'Comment was not created.'
      end

      redirect_to post_path(@post)
    end

    def update
      @comment = @post.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to post_path(@post), alert: 'Comment is updated!'
      else
        redirect_to post_path(@post), alert: 'Comment is not updated!'
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      if @comment.destroyed?
        flash[:notice] = 'Comment was successfully destroyed.'
      else
        flash[:alert] = 'Comment was not destroyed.'
      end
    end

    private

    def authorize
      authorize @comment
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end
