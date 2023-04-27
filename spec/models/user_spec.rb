# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:reports).dependent(:destroy) }
    it { is_expected.to have_many(:suggestions).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe 'email validation' do
    it 'has a valid email' do
      user = build(:user, email: 'test@test')
      expect(user).to be_valid
    end

    it 'has not a valid email' do
      user = build(:user, email: 'test')
      expect(user).not_to be_valid
    end
  end

  describe 'roles' do
    it { is_expected.to define_enum_for(:role).with_values(%i[Author Moderator Admin]) }
  end
end
