# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :like do
    user

    trait :post do
      association :likeable, factory: :post
    end

    trait :comment do
      association :likeable, factory: :comment
    end
  end
end
