# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    #byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    #render plain: params[:article]
    #@article = Article.new(params[:article])
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    #render plain: @article.inspect
    redirect_to article_path(@article)
  end
end
