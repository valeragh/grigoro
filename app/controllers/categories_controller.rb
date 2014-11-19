class CategoriesController < ApplicationController
  before_action :load_parent

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = @template.categories.new
  end

  def create
    @category = @template.categories.new(category_params)

    if @category.save
      redirect_to template_categories_path, notice: 'Category was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to template_category_path(@template, @category), notice: 'Category was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    redirect_to template_categories_path, notice: 'Category deleted'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def load_parent
    @template = Template.find(params[:template_id])
  end
end
