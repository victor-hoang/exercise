# frozen_string_literal: true

class DeveloperLanguage < ApplicationRecord
  belongs_to :developer
  belongs_to :language
end
