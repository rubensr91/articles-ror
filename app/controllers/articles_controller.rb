class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def find_article
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(article_params)
        
        redirect_to @article
    end

    def update
        @article.update(article_params)

        redirect_to @article
    end

    def destroy
        @article.destroy

        redirect_to root_path
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
    
end
