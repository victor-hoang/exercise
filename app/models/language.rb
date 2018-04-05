# frozen_string_literal: true

class Language < ApplicationRecord
  validates :code, uniqueness: true, presence: true

  has_many :developer_languages, dependent: :destroy
  has_many :developers, through: :developer_languages
end
