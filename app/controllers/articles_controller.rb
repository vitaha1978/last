class ArticlesController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    
    def index
        
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new article_params
        
        if @article.save
            redirect_to @article, notice: "Привіт, Адміне))) Твою статтю успішно створено)))"
        else
            render 'new', notice: "О, ні... щось пішло не так((( Я не зміг зберегти статтю"
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @article.update article_params
            redirect_to @article, notice: "Ок... статтю успішно оновлено))"
        else
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    private
    
        def article_params
            params.require(:article).permit(:title, :content)
        end
        
        def find_post
            @article = Article.find(params[:id])
        end
end
