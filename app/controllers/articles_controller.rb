class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.page(params[:page]).per(20)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      flash[:notice] = "Sucessfully post a article"
      redirect_to root_path
    else
      flash.now[:alert] = "Post fail"
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Artilce was successfully updated"
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "Article was failed to update"
      render :edit
    end
  end



  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :role, :user_id, :category_id)
  end

end
