class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save 
        format.html { redirect_to categories_path, notice: "categoria creada" }
      else
        format.html { redirect_to categories_path, notice: "categoria no creada" }
      end
    end
  end

  def update 
    @category = Category.find(params[:id])
    # @category.public = @category.subcategories.public
    respond_to do |f|
      if @category.update!(categry_params) 
        f.html { redirect_to root_path, notice: "creaste"}
      else
        f.html { redirect_to root_path, alert: "boo"}
      end
    end
  end

  def api
    @category = Category.find(params[:id])
    render json: @category.to_json(include: :sub_categories)
  end

  private

  def category_params
    params.require(:category).permit(:title, :public, :category_id)
  end
end
