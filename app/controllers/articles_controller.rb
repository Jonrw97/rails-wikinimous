class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article
  end

  def update
    @article.update(articles_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.delete
    redirect_to articles_path, status: :see_other
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
