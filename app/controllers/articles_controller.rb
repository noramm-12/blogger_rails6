# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]

    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article was created successfully.' # sending success message by flash
      redirect_to article_path(@article) # prefix:article => show.html.erb
    else
      render 'new' # new.html erb
    end

    # render plain: @article.inspect
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was edited successfully.' # sending success message by flash
      redirect_to article_path(@article) # show
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path # prefix:articles => index.html.erb
  end
end
