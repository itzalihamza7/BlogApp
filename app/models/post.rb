# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :elements, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_one_attached :header_image

  validates :title, :description, presence: true
  validates :description, length: { within: 30..250 }
  friendly_id :title, use: %i[slugged history finders]

  scope :published, -> { where(published: true) }
  scope :most_recently_published, -> { order(published_at: :desc) }

  def should_generate_new_friendly_id?
    title_changed?
  end
end
