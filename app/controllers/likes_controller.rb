# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    @likeable = @like.likeable
    if @like.save
      flash[:notice] = 'Like was successfully created.'
    else
      flash[:alert] = 'Like was not created.'
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @likeable = @like.likeable
    authorize @like
    @like.destroy
    if @like.destroyed?
      flash[:notice] = 'Like was successfully destroyed.'
    else
      flash[:alert] = 'Like was not destroyed.'
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
