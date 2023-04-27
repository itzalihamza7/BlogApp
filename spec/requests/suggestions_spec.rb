# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Readers/Suggestions', type: :request do
  let(:user) { create(:user, :Author) }
  let(:dummy_post) { create(:post) }
  let(:dummy_suggestion) { create(:suggestion, user: user, post: dummy_post) }
  let(:valid_suggestion_params) { { body: Faker::Lorem.paragraph } }
  let(:invalid_suggestion_params) { { body: '' } }

  describe 'GET /index' do
    context 'when user is authorized' do
      before { sign_in user }

      it 'shows all suggestions' do
        get post_suggestions_path(dummy_post)

        expect(response).to render_template('index')
      end
    end

    context 'when user is not authorized' do
      it 'redirects to login page' do
        get post_suggestions_path(dummy_post)

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Create suggestion' do
    context 'when user is authorized' do
      before { sign_in user }

      it 'redirects to suggestions page' do
        post post_suggestions_path(dummy_post), params: { suggestion: valid_suggestion_params }

        expect(response).to redirect_to(post_suggestions_path(dummy_post))
      end

      it 'does not create a new suggestion with invalid params' do
        post post_suggestions_path(dummy_post), params: { suggestion: invalid_suggestion_params }

        expect(flash[:alert]).to eq('suggestion has not been created')
      end
    end

    context 'when user is not authorized' do
      it 'redirects to login page' do
        post post_suggestions_path(dummy_post), params: { suggestion: valid_suggestion_params }

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Update suggestion' do
    context 'when user is authorized' do
      before { sign_in user }

      it 'redirects to suggestions page' do
        patch post_suggestion_path(dummy_post, dummy_suggestion), params: { suggestion: valid_suggestion_params }
        expect(response).to redirect_to(post_suggestions_path(dummy_post))
      end

      it 'fail to update suggestion with invalid params ' do
        patch post_suggestion_path(dummy_post, dummy_suggestion), params: { suggestion: invalid_suggestion_params }
        expect(flash[:alert]).to eq('suggestion was not updated')
      end
    end

    context 'when user is not authorized' do
      it 'redirects to login page' do
        patch post_suggestion_path(dummy_post, dummy_suggestion), params: { suggestion: valid_suggestion_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Destroy suggestion' do
    context 'when user is authorized' do
      before { sign_in user }

      it 'deletes the suggestion' do
        delete post_suggestion_path(dummy_post, dummy_suggestion)

        expect(flash[:notice]).to eq('Suggestion was successfully deleted')
      end

      it 'suggestion not found' do
        delete post_suggestion_path(dummy_post, Faker::Number.number(digits: 5))

        expect(flash[:alert]).to eq('The record you are looking for could not be found')
      end
    end

    context 'when user is not authorized' do
      it 'redirects to login page' do
        delete post_suggestion_path(dummy_post, dummy_suggestion)

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
