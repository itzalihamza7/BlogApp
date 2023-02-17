# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user

    trait :published do
      published { true }
      published_at { Time.zone.now }
    end

    trait :unpublished do
      published { false }
      published_at { Time.zone.now }
    end

    trait :with_header_image do
      header_image do
        Rack::Test::UploadedFile.new('spec/support/images/header_image.png', 'image/png')
      end
    end
  end
end
