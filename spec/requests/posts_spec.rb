# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors/Posts', type: :request do
  let(:user) { create(:user, :Author) }
  let(:dummy_post) { create(:post, user: user) }
  let(:valid_post_params) { { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph } }
  let(:invalid_post_params) { { title: '', description: '' } }
  let(:wrong_id) { Faker::Number.number(digits: 5) }

  describe 'GET /index' do
    # context 'when user is authorized' do
    #   before { sign_in user }

    #   it 'shows all posts' do
    #     get authors_posts_path

    #     expect(response).to render_template('index')
    #   end
    # end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       get authors_posts_path

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end

  # describe 'GET /new' do
  #   context 'when user is authorized' do
  #     before { sign_in user }

  #     it 'shows new post form' do
  #       get new_authors_post_path

  #       expect(response).to render_template('new')
  #     end
  #   end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       get new_authors_post_path

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end

  # describe 'Edit Post' do
  #   context 'when user is authorized' do
  #     before { sign_in user }

  #     it 'renders edit post template with correct id' do
  #       get edit_authors_post_path(dummy_post)

  #       expect(response).to render_template('edit')
  #     end

  #     it 'post not found when incorrect id' do
  #       get edit_authors_post_path(wrong_id)

  #       expect(flash[:alert]).to eq('The record you are looking for could not be found')
  #     end
  #   end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       get edit_authors_post_path(dummy_post)

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end

  # describe 'Create post' do
  #   context 'when user is authorized' do
  #     before { sign_in user }

  #     it 'redirects to new Post with valid params' do
  #       post authors_posts_path, params: { post: valid_post_params }

  #       expect(response).to redirect_to(edit_authors_post_path(Post.last))
  #     end

  #     it 'redirects to new post form' do
  #       post authors_posts_path, params: { post: invalid_post_params }

  #       expect(response).to redirect_to(new_authors_post_path)
  #     end
  #   end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       post authors_posts_path, params: { post: valid_post_params }

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end

  # describe 'Update post' do
    context 'when user is authorized' do
      before { sign_in user }

      it 'redirects to updated post with valid params' do
        byebug
        put authors_post_path(dummy_post), params: { post: valid_post_params }

        dummy_post.reload
        expect(response).to redirect_to(edit_authors_post_path(dummy_post))
      end

      it 'Cannot update post with invalid params' do
        put(authors_post_path(dummy_post), params: { post: invalid_post_params })

        expect(response).to redirect_to(edit_authors_post_path(dummy_post))
      end
    end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       patch authors_post_path(dummy_post), params: { post: valid_post_params }

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end

  # describe 'Delete post' do
  #   context 'when user is authorized' do
  #     before { sign_in user }

  #     it 'redirects to the posts list' do
  #       delete authors_post_path(dummy_post)

  #       expect(response).to redirect_to(authors_posts_path)
  #     end

  #     it 'Post not found with incorrect id' do
  #       delete authors_post_path(wrong_id)

  #       expect(flash[:alert]).to eq('The record you are looking for could not be found')
  #     end
  #   end

  #   context 'when user is not authorized' do
  #     it 'redirects to login page' do
  #       delete authors_post_path(dummy_post)

  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  end
end

# Path: spec/requests/posts_spec.rb
