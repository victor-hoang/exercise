# frozen_string_literal: true

class Developer < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many :developer_programming_languages, dependent: :destroy
  has_many :programming_languages, through: :developer_programming_languages

  has_many :developer_languages, dependent: :destroy
  has_many :languages, through: :developer_languages
end
