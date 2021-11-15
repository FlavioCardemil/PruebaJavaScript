class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @types = Type.all
    @categories = Category.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end


  def create
    @bookmark = Bookmark.new(bookmark_params)
    respond_to do |format|
      if @bookmark.save 
        format.js { render nothing: true, notice: 'Marca creada.' }
      else
        format.html { redirect_to root_path, alert: "boo" }
      end
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @types = Type.all
    @categories = Category.all
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    respond_to do |format|
      if @bookmark.update(bookmark_params) 
        format.js { }
      else
        format.html { redirect_to root_path, alert: "boo" }
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    respond_to do |format|
      if @bookmark.destroy! 
        format.js { }
      else
        format.html { redirect_to root_path, alert: "boo" }
      end
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :category_id, :type_id)
  end

end
