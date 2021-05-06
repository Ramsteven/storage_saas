class ItemsController < ApplicationController
  before_action :set_box
  before_action :set_item, only: [:show, :edit, :update, :destroy,:update_use, :move ]

  # GET boxes/1/items
  def index
    @items = @box.items
  end

  # GET boxes/1/items/1
  def show
  end

  # GET boxes/1/items/new
  def new
    @item = @box.items.build
  end

  # GET boxes/1/items/1/edit
  def edit
  end

  # POST boxes/1/items
  def create
    @item = @box.items.build(item_params)
    if @item.save
      redirect_to([@item.box, @item], notice: 'Item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT boxes/1/items/1
  def update
    if @item.update_attributes(item_params)
      redirect_to([@item.box, @item], notice: 'Item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE boxes/1/items/1
  def destroy
    @item.destroy

    redirect_to box_items_url(@box)
  end
  
  def update_use
    if @item.in_use == false
      @item.update(in_use:toggle(@item.in_use), using_by: current_user.email)
      redirect_to box_items_path(@item.box_id )
    else
      if current_user.email == @item.using_by
        @item.update(in_use:toggle(@item.in_use), using_by: :null)
        redirect_to box_items_path(@item.box_id )
      else
        redirect_to box_items_path(@item.box_id ), notice: "only #{@item.using_by} can stop using this item"
      end
    end
  end


  def move
    new_id = Box.find_by(description: params[:box]).id
    unless @item.in_use
      @item.update(box_id: new_id )
      redirect_to @box , notice: "This item was moved successfully"
    else
      redirect_to([@item.box, @item], notice: "This item is been used can't be moved currently used by #{@item.using_by}")
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:box_id])
    end

    def set_item
      @item = @box.items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:description, :image)
    end

    def toggle(value)
      if value
        value = false
      else
        value = true
      end
    end
end
