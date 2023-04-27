# frozen_string_literal: true

module Authors
  class ElementsController < UsersController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_element, only: %i[update destroy]

    def create
      @element = @post.elements.build(element_params)

      if @element.save
        flash[:notice] = 'Element was successfully created.'
      else
        flash[:alert] = 'Element was not created.'
      end
      redirect_to edit_authors_post_path(@post), notice: notice
    end

    def update
      if @element.update(element_params)
        flash[:notice] = 'Element was successfully updated.'
      else
        flash[:alert] = 'Element was not updated.'
      end

      redirect_to edit_authors_post_path(@post) if @element.paragraph?
    end

    def destroy
      @element.destroy
      if @element.destroyed?
        flash[:notice] = 'Element was successfully destroyed.'
      else
        flash[:alert] = 'Element was not destroyed.'
      end

      redirect_to edit_authors_post_path(@element.post)
    end

    private

    def set_post
      @post = current_user.posts.find(params[:post_id])
    end

    def set_element
      @element = @post.elements.find(params[:id])
    end

    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
  end
end
