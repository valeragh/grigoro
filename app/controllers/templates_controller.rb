class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
    @items = @template.items
    @categories = @template.categories
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to @template, notice: 'Template was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])

    if @template.update_attributes(template_params)
      redirect_to @template, notice: 'Template was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @template = Template.find(params[:id]).destroy
    redirect_to templates_url, notice: 'Template deleted'
  end

  def fill
    @template = Template.find(params[:id])

    @categories = @template.categories
    @items = @template.items
    @items_count = @items.count

    @item_category_values = ItemCategoryValue.all_as_hash

    render action: 'fill'  
  end

  def complete

  end

  private
  def template_params
    params.require(:template).permit(:name, :description)
  end
end
