# frozen_string_literal: true

class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_languages do |t|
      t.integer :developer_id
      t.integer :language_id

      t.timestamps
    end
  end
end
