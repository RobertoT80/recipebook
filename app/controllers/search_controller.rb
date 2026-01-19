class SearchController < ApplicationController
  def index

    @query = params[:q]  # Capture the search term from query parameters
    if @query.present?
      @results = Recipe.joins(:rich_text_description)
      .where("action_text_rich_texts.body LIKE ?", "%#{@query}%")
    else
      @results = Recipe.all
    end

  end
end
