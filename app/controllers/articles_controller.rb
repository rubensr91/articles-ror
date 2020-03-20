class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @article = Article.new
        @article.title = 'Demo'
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])

        render json: @article
    end
    
end
