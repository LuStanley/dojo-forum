class ArticlesController < ApplicationController

  def index
    @articles = Article.page(params[:page]).per(20)
  end

end
