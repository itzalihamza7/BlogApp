# frozen_string_literal: true

module Readers
  class SuggestionsController < UsersController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :set_post, only: %i[create index destroy update]
    before_action :set_suggestion, only: %i[update destroy]
    before_action :authorize_suggestion, only: %i[update destroy]

    def index
      @suggestions = @post.suggestions.all
    end

    def create
      @suggestion = @post.suggestions.create(suggestion_params)
      @suggestion.user = current_user
      if @suggestion.save
        flash[:notice] = 'suggestion was successfully created'
      else
        flash[:alert] = 'suggestion has not been created'
      end

      redirect_to post_suggestions_path(@post)
    end

    def update
      if @suggestion.update(suggestion_params)
        flash[:notice] = 'suggestion was successfully updated'
      else
        flash[:alert] = 'suggestion was not updated'
      end

      redirect_to post_suggestions_path(@post)
    end

    def destroy
      if @suggestion.destroy
        flash[:notice] = 'Suggestion was successfully deleted'
      else
        flash[:alert] = 'Suggestion was not deleted'
      end
    end

    private

    def set_suggestion
      @suggestion = @post.suggestions.find(params[:id])
    end

    def authorize_suggestion
      authorize @suggestion
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:body)
    end
  end
end
