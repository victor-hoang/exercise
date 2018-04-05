# frozen_string_literal: true

FactoryBot.define do
  factory :programming_language do
    name { Faker::ProgrammingLanguage.name }
  end
end
