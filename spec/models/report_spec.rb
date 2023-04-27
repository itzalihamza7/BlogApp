# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:reportable) }
  end

  describe 'validations' do
    let(:dummy_post) { create(:post) }
    let(:report) { create(:report, reportable: dummy_post) }

    it { expect(report).to validate_uniqueness_of(:user_id).scoped_to(:reportable_id, :reportable_type) }
  end
end
