class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        render json: @article
    end

    def show
        @article = Article.find(params[:id])
    end
    
end
