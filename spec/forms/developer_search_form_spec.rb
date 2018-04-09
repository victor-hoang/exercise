# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperSearchForm do
  describe '#search' do
    context 'with no params' do
      it 'returns all developers' do
        create_list(:developer, 2)
        form = DeveloperSearchForm.new
        expect(form.search.size).to eq(2)
      end
    end

    context 'with params' do
      let(:language) { create :language }
      let(:programming_language) { create :programming_language }

      it 'returns developers that match the language ' do
        create :developer, languages: [language]
        form = DeveloperSearchForm.new(language_id: language.id)
        expect(form.search.size).to eq(1)
      end

      it 'returns developers that match the programming language ' do
        create :developer, programming_languages: [programming_language]
        form = DeveloperSearchForm.new(programming_language_id: programming_language.id)
        expect(form.search.size).to eq(1)
      end

      it 'returns developers that match the language and programming language ' do
        create :developer, languages: [language], programming_languages: [programming_language]
        form = DeveloperSearchForm.new(language_id: language.id, programming_language_id: programming_language.id)
        expect(form.search.size).to eq(1)
      end
    end
  end
end
