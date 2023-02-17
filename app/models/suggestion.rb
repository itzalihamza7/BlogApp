# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  validates :body, presence: true
end
