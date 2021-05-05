class ItemsController < ApplicationController
  before_action :set_box
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET boxes/1/items
  def index
    @items = @box.items
  end

  # GET boxes/1/items/1
  def show
    byebug
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
end
