class ItemsController < ApplicationController
  before_action :load_parent

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = @template.items.new
  end

  def create
    @item = @template.items.new(item_params)

    if @item.save
      redirect_to template_items_path, notice: 'Item was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to template_item_path(@template, @item), notice: 'Item was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id]).destroy
    redirect_to template_items_path, notice: 'Item deleted'
  end

  private
  def item_params
    params.require(:item).permit(:description)
  end

  def load_parent
    @template = Template.find(params[:template_id])
  end
end
