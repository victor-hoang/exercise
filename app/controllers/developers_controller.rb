# frozen_string_literal: true

class DevelopersController < ApplicationController
  def index
    @developer_search_form = DeveloperSearchForm.new
  end

  def search
    @developer_search_form = DeveloperSearchForm.new(search_params)
    @developers = @developer_search_form.search

    render :index
  end

  private

  def search_params
    params.require('developer_search_form')
          .permit(:programming_language, :language)
  end
end
