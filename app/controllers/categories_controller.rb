class CategoriesController < ApplicationController
  before_action :load_template
  before_action :load_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = @template.categories.new(category_params)

    @template.items.each do |item|
      item.categories << @category
    end

    if @category.save
      redirect_to template_categories_path, notice: 'Category was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to template_category_path(@template, @category), notice: 'Category was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to template_categories_path, notice: 'Category deleted'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def load_template
    @template = Template.find(params[:template_id])
  end

  def load_category
    @category = Category.find(params[:id])
  end
end
