class ArticlesController < ApplicationController
  before_filter :authorize
  before_action :set_article, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    params[:article][:content] = kramdown(params[:article][:content])
    Article.create(article_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to root_path
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])

  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def kramdown(text)
  return Kramdown::Document.new(text).to_html
  end

end
