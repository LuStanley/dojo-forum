class ArticlesController < ApplicationController

  def index
    @articles = Article.page(params[:page]).per(20)
  end

  def new
    @article = Article.new
  end
end
