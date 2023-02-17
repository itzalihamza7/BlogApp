# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :suggestion do
    body { 'dd  wswwqwdwqdwdqwddwqwdwqwqddqwwdqw' }
    user
    post
  end
end
