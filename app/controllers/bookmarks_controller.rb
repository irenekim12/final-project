class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all.order({ :created_at => :desc })

    render({ :template => "bookmarks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @bookmark = Bookmark.where({:id => the_id }).at(0)

    render({ :template => "bookmarks/show.html.erb" })
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.furniture_id = params.fetch("query_furniture_id")
    @bookmark.user_id = params.fetch("query_user_id")

    if @bookmark.valid?
      @bookmark.save
      redirect_to("/bookmarks", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/bookmarks", { :notice => "Bookmark failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @bookmark = Bookmark.where({ :id => the_id }).at(0)

    @bookmark.furniture_id = params.fetch("query_furniture_id")
    @bookmark.user_id = params.fetch("query_user_id")

    if @bookmark.valid?
      @bookmark.save
      redirect_to("/bookmarks/#{@bookmark.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/bookmarks/#{@bookmark.id}", { :alert => "Bookmark failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @bookmark = Bookmark.where({ :id => the_id }).at(0)

    @bookmark.destroy

    redirect_to("/bookmarks", { :notice => "Bookmark deleted successfully."} )
  end
end
