# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:reports).dependent(:destroy) }
    it { is_expected.to have_many(:elements).dependent(:destroy) }
    it { is_expected.to have_many(:suggestions).dependent(:destroy) }
    it { is_expected.to have_one_attached(:header_image) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(30).is_at_most(250) }
  end

  describe 'friendly_id' do
    it { is_expected.to respond_to(:slug) }
    it { is_expected.to respond_to(:should_generate_new_friendly_id?) }
  end

  describe 'published' do
    described_class.destroy_all
    let(:post_unpub) { create(:post, :unpublished) }
    let(:post_pub) { create(:post, :published) }

    it 'returns published posts' do
      published_posts = described_class.published
      expect(published_posts).to eq([post_pub])
    end

    it 'returns unpublished posts' do
      all_posts = described_class.all
      expect(all_posts).to eq([post_unpub, post_pub])
    end
  end

  describe 'most_recently_published' do
    described_class.destroy_all
    let(:post_first) { create(:post, published_at: 1.day.ago) }
    let(:post_second) { create(:post, published_at: 2.days.ago) }
    let(:post_third) { create(:post, published_at: 3.days.ago) }

    it 'returns the most recently published posts' do
      posts_sequenced_desc = described_class.most_recently_published
      expect(posts_sequenced_desc).to eq([post_first, post_second, post_third])
    end
  end

  describe ':header_image' do
    it 'is an image' do
      post = create(:post, :with_header_image)
      expect(post.header_image).to be_attached
    end
  end
end
