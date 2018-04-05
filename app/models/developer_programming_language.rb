# frozen_string_literal: true

class DeveloperProgrammingLanguage < ApplicationRecord
  belongs_to :developer
  belongs_to :programming_language
end
