# frozen_string_literal: true

FactoryBot.define do
  factory :developer do
    email { Faker::Internet.email }
  end
end
