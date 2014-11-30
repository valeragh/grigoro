class ItemsController < ApplicationController
  before_action :load_template
  before_action :load_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = @template.items.new(item_params)

    @template.categories.each do |category|
      @item.categories << category
    end

    if @item.save
      redirect_to template_items_path, notice: 'Item was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to template_item_path(@template, @item), notice: 'Item was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to template_items_path, notice: 'Item deleted'
  end

  private
  def item_params
    params.require(:item).permit(:description)
  end

  def load_template
    @template = Template.find(params[:template_id])
  end

  def load_item
    @item = Item.find(params[:id])
  end
end
