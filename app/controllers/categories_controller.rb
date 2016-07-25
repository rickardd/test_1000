class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate( page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new( category_params )
    if @category.save
      flash[:success] = "New categroy is saved"
      redirect_to categories_path
    else
      flash.now[:danger] = "Categroy failed to be saved"
      render :new
      # redirect_to categories_path( method: :post )
    end
  end

  def show

  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
