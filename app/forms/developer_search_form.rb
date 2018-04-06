# frozen_string_literal: true

class DeveloperSearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :email, String
  attribute :language_id, Integer
  attribute :programming_language_id, Integer

  def search
    query = Developer.all
    query = search_by_programming_language(query) if programming_language_id.present?
    query = search_by_language(query) if language_id.present?
    query
  end

  private

  def search_by_programming_language(query)
    query.includes(:developer_programming_languages)
         .joins(:developer_programming_languages)
         .where(
           'developer_programming_languages.programming_language_id=?',
           programming_language_id
         )
  end

  def search_by_language(query)
    query.includes(:developer_languages)
         .joins(:developer_languages)
         .where(
           'developer_languages.language_id=?',
           language_id
         )
  end
end
