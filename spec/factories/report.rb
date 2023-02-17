# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :report do
    user
    trait :post do
      association :reportable, factory: :post
    end

    trait :comment do
      association :reportable, factory: :comment
    end
  end
end
