# frozen_string_literal: true

class DeveloperSerializer < ActiveModel::Serializer
  attributes :email

  has_many :programming_languages
  has_many :languages
end
