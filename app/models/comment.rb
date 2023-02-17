# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_rich_text :body

  validates :body, presence: true
end
