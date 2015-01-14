class ArticlesController < ApplicationController
	before_filter :logged_in, except: [:index]

	def index
		@articles = Article.all
		render :index
	end

	def new
		@article = Article.new
		render :new
	end

	def show
		@article = Article.find(params[:id])
		@keywordResults = @article.make_request
		render :show
	end

	def edit
		@article = Article.find(params[:id])
		render :edit
	end

	def create
	    new_article = params.require(:article).permit(:title, :author, :content)
	    article = Article.create(new_article)
	    redirect_to articles_path
    end

	def update
		article = Article.find(params[:id])
		article_params = params.require(:article).permit(:title, :author, :content)
		article.update_attributes(article_params)
		redirect_to article_path(article)
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy
		redirect_to articles_path
	end

private
	def require_login
	    unless @current_user 
	      flash[:error] = "You must be logged in to access this section"
	      redirect_to "/login"
	    end
	  end

end
