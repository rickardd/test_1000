class ArticlesController < ApplicationController

  before_action :set_article, only: [ :edit, :update, :show, :destroy ]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
    @hello = "hello"
  end


  def create
    @article = Article.new( article_params )
    @article.user = User.last
    @article.save

    if( @article.save)
      flash[:success] = "Article was successfully created"
      redirect_to article_path( @article )
    else
      render :new
    end

    # render plain: @article.errors.full_messages.inspect + Article.last.inspect
  end

  def edit
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully destroyed"
    redirect_to articles_path
  end

  def update
    if @article.update( article_params )
      flash[:success] = "Article was successfully updated"
      redirect_to article_path( @article )
    else
      render :edit
    end
  end

  def show
  end

  private
    def set_article
      @article = Article.find( params[:id] )
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

