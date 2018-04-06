# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'search developer ', type: :system do
  before do
    ruby_programming_language = create :programming_language, name: 'Ruby'
    create :programming_language, name: 'Javascript'
    create :programming_language, name: 'Php'
    create :language, code: 'vn'

    @ruby_developer = create :developer,
                             email: 'phan.nguyen@example.com',
                             programming_languages: [ruby_programming_language]
    @ruby_developer_english = create :developer,
                                     email: 'quang.pham@example.com',
                                     programming_languages: [ruby_programming_language],
                                     languages: [create(:language, code: 'en')]
  end

  it 'search with programming language condition' do
    visit('/')

    select 'Ruby', from: 'developer_search_form[programming_language_id]'
    click_on 'Search'

    expect(page).to have_content(@ruby_developer.email)
  end

  it 'search with language condition' do
    visit('/')

    select 'en', from: 'developer_search_form[language_id]'
    click_on 'Search'

    expect(page).to have_content(@ruby_developer_english.email)
  end

  it 'search with programming language and language conditions' do
    visit('/')

    select 'Ruby', from: 'developer_search_form[programming_language_id]'
    select 'en', from: 'developer_search_form[language_id]'
    click_on 'Search'

    expect(page).to have_content(@ruby_developer_english.email)
  end
end
