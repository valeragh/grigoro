class TemplatesController < ApplicationController
  before_action :load_template, except: [:index, :new, :create]

  def index
    @templates = Template.all
  end

  def show
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
  end

  def update
    if @template.update_attributes(template_params)
      redirect_to @template, notice: 'Template was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @template.destroy
    redirect_to templates_url, notice: 'Template deleted'
  end

  def fill
  end

  def complete
    if @template.update_attributes(fill_params)
      redirect_to @template, notice: 'Template was successfuly filled'
    else
      render action 'fill'
    end
  end

  private

  def template_params
    params.require(:template).permit(:name, :description)
  end

  def load_template
    @template = Template.find(params[:id])
  end

  def fill_params
    params.require(:template).permit(items_attributes: [:id, { values_attributes: [:value, :id] }])
  end
end
