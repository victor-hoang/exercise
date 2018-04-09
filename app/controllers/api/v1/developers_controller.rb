# frozen_string_literal: true

module Api
  module V1
    class DevelopersController < Api::BaseController
      def index
        developers = Developer.includes(
          :developer_programming_languages,
          :programming_languages,
          :developer_languages,
          :languages
        )
        render json: developers, include: []
      end
    end
  end
end
