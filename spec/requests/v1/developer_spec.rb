# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::DevelopersController', type: :request do
  include_context 'api'

  describe 'GET /api/v1/developers/:id' do
    context 'when the developer exists' do
      let(:programming_languages) do
        {
          data: @developer.programming_languages.map do |programming_language|
            {
              id: programming_language.id,
              name: programming_language.name
            }
          end
        }
      end
      let(:languages) do
        {
          data: @developer.languages.map do |language|
            {
              id: language.id,
              code: language.code
            }
          end
        }
      end
      let(:expected_response) do
        {
          data: {
            id: @developer.id.to_s,
            type: 'developers',
            attributes: {
              email: @developer.email
            },
            relationships: {
              "programming-languages": programming_languages,
              languages: languages
            }
          }
        }
      end

      before do
        @developer = create :developer,
                            programming_languages: [create(:programming_language)],
                            languages: [create(:language)]

        get "/api/v1/developers/#{@developer.id}"
      end

      it_behaves_like 'http_status_code_200_with_json'
    end

    context 'when the developer does not exist' do
      before do
        get '/api/v1/developers/non_existing_developer_id'
      end

      it_behaves_like 'http_status_code_404'
    end
  end
end
