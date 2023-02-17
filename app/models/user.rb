# frozen_string_literal: false

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    Author: 0,
    Moderator: 1,
    Admin: 2
  }
end
