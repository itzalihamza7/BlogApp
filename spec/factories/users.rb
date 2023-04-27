# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    password_confirmation { password }
  end

  trait :author do
    role { :Author }
  end

  trait :moderator do
    role { :Moderator }
  end

  trait :admin do
    role { :Admin }
  end
end
