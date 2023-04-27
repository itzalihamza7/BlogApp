# frozen_string_literal: true

class Element < ApplicationRecord
  belongs_to :post
  has_one_attached :image
  has_rich_text :content

  validates :element_type, presence: true
  validates :element_type, inclusion: { in: %w[paragraph image] }

  def paragraph?
    element_type == 'paragraph'
  end

  def image?
    element_type == 'image'
  end
end
