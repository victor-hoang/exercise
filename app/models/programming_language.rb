# frozen_string_literal: true

class ProgrammingLanguage < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :developer_programming_languages, dependent: :destroy
  has_many :developers, through: :developer_programming_languages
end
