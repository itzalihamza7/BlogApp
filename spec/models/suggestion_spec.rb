# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
    it { is_expected.to have_rich_text(:body) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
