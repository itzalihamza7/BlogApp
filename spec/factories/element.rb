# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :element do
    content { Faker::Lorem.paragraph }
    post

    trait :paragraph do
      element_type { 'paragraph' }
    end

    trait :image do
      element_type { 'image' }
    end

    trait :video do
      element_type { 'video-embed' }
    end
  end
end
