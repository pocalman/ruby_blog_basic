class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
def new
  @article = Article.new
  @categories = Category.all.map{|c| [ c.title, c.id ] }
end
def create
  @article = Article.new(article_params)
  @article.user = User.first
  @article.category_id = params[:category_id]
  if @article.save
   flash[:notice] = "Article was successfully created"
   redirect_to article_path(@article)
  else
   render 'new'
  end
end
def show
end
def update
  @categories = Category.all.map{|c| [ c.title, c.id ] }
  @article.category_id = params[:category_id]
  if @article.update(article_params)
    flash[:success] = "Article was updated"
   redirect_to article_path(@article)
  else
   flash[:notice] = "Article was not updated"
   render 'edit'
  end
end
def edit
  @categories = Category.all.map{|c| [ c.title, c.id ] }
  @article.category_id = params[:category_id]
end
def index
  @articles = Article.paginate(page: params[:page], per_page: 3)
end
def destroy
  @article.destroy
  flash[:success] = "Article was deleted"
  redirect_to articles_path
end
private
  def article_params
   params.require(:article).permit(:title, :description, :category_id)
  end
def set_article
   @article = Article.find(params[:id])
  end
end