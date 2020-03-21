class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def find_article
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        render json: @article
    end

    def show
    end

    def edit
    end

    def update
        @article.update(title: params[:article][:title], content: params[:article][:content])

        redirect_to @article
    end

    def destroy
        @article.destroy

        redirect_to root_path
    end
    
end
