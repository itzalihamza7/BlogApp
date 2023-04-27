# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    user
    post
  end
end
