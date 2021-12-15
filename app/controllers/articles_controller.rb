class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(params_required)
    if @article.save
      flash[:notice] = 'Article was successfully created!'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(params_required)
      flash[:notice] = 'Article was successfully updated!'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = 'Article was successfully deleted'
    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_required
    params.require(:article).permit(:title, :description)
  end
end
