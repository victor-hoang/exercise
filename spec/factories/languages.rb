# frozen_string_literal: true

FactoryBot.define do
  factory :language do
    code { Faker::Address.country_code.downcase }
  end
end
