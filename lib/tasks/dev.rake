# frozen_string_literal: true

namespace :dev do
  require 'factory_bot_rails'
  require 'faker'
  desc 'Create dummy developer’s records'
  task :generate_data, [:developer_number] => :environment do |_, args|
    args(args)

    %w[en vn].each do |code|
      FactoryBot.create :language, code: code
    end

    %w[ruby java kotlin].each do |name|
      FactoryBot.create :programming_language, name: name
    end

    languagues = Language.pluck(:id)
    programmings = ProgrammingLanguage.pluck(:id)

    @args[:developer_number].times do
      email = loop do
        email = Faker::Internet.email
        break email unless Developer.exists?(email: email)
      end
      developer = FactoryBot.create(:developer, email: email)

      DeveloperLanguage.find_or_create_by(developer_id: developer.id, language_id: languagues.sample(Random.rand(0..2)))
      DeveloperProgrammingLanguage.find_or_create_by(developer_id: developer.id, programming_language_id: programmings.sample(Random.rand(0..3)))
    end
  end
end

def args(args)
  @args = {}
  @args[:developer_number] = (args.developer_number || 100).to_i
end
