class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all.order({ :created_at => :desc })

    render({ :template => "furnitures/index.html.erb" })
  end


  def show
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({:id => the_id }).at(0)
    render({ :template => "furnitures/show.html.erb" })
  end

  def create
    @furniture = Furniture.new
    @furniture.name = params.fetch("query_name")
    @furniture.image = params.fetch("query_image")
    @furniture.owner_id = @current_user.id
    @furniture.location = params.fetch("query_location")
    @furniture.item_details = params.fetch("query_item_details")
    @furniture.category = params.fetch("query_category")
    @furniture.retailer = params.fetch("query_retailer")
    @furniture.retail_price = params.fetch("query_retail_price")
    @furniture.purchase_date = params.fetch("query_purchase_date")
    @furniture.asking_price = params.fetch("query_asking_price")
    @furniture.sell_by = params.fetch("query_sell_by")
    @furniture.notes = params.fetch("query_notes")

    if @furniture.valid?
      @furniture.save
      redirect_to("/furnitures", { :notice => "Furniture created successfully." })
    else
      redirect_to("/furnitures", { :notice => "Furniture failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({ :id => the_id }).at(0)

    @furniture.name = params.fetch("query_name")
    @furniture.image = params.fetch("query_image")
    @furniture.owner_id = params.fetch("query_owner_id")
    @furniture.location = params.fetch("query_location")
    @furniture.item_details = params.fetch("query_item_details")
    @furniture.category = params.fetch("query_category")
    @furniture.retailer = params.fetch("query_retailer")
    @furniture.retail_price = params.fetch("query_retail_price")
    @furniture.purchase_date = params.fetch("query_purchase_date")
    @furniture.asking_price = params.fetch("query_asking_price")
    @furniture.sell_by = params.fetch("query_sell_by")
    @furniture.notes = params.fetch("query_notes")

    if @furniture.valid?
      @furniture.save
      redirect_to("/furnitures/#{@furniture.id}", { :notice => "Furniture updated successfully."} )
    else
      redirect_to("/furnitures/#{@furniture.id}", { :alert => "Furniture failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({ :id => the_id }).at(0)

    @furniture.destroy

    redirect_to("/furnitures", { :notice => "Furniture deleted successfully."} )
  end


  def form
    render({ :template => "furnitures/form.html.erb" })
  end

end
