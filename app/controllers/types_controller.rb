class TypesController < ApplicationController
  def index
    @type = Type.new
    @types = Type.all
    @bookmarks = Bookmark.all
  end

  def create
    @type = Type.new(type_params)
    
    respond_to do |format|
      if @type.save 
        format.html { redirect_to root_path, notice: "tipo creado" }
      else
        format.html { redirect_to root_path, notice: "tipo no creado" }
      end
    end
  end

  private

  def type_params
    params.require(:type).permit(:title)
  end

end
