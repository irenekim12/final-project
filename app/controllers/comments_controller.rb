class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order({ :created_at => :desc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @comment = Comment.where({:id => the_id }).at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    @comment = Comment.new
    @comment.author_id = session.fetch(:user_id)
    @comment.furniture_id = params.fetch("query_furniture_id")
    @comment.body = params.fetch("query_body")

    if @comment.valid?
      @comment.save
      redirect_to("/furnitures/#{@comment.furniture.id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/furnitures/#{@comment.furniture.id}", { :notice => "Comment failed to create successfully." })
    end
  end





  def update
    the_id = params.fetch("path_id")
    @comment = Comment.where({ :id => the_id }).at(0)

    @comment.author_id = params.fetch(:user_id)
    @comment.furniture_id = params.fetch("query_furniture_id")
    @comment.body = params.fetch("query_body")

    if @comment.valid?
      @comment.save
      redirect_to("/comments/#{@comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{@comment.id}", { :alert => "Comment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @comment = Comment.where({ :id => the_id }).at(0)

    @comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end
end
