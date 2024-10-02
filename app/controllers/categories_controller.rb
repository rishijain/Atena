class CategoriesController < ApplicationController
  def new
    @category = current_user.categories.new
  end

  def create
    # Initialize the category with the name
    @category = current_user.categories.new(name: category_params[:name])

    # Check if dynamic fields exist and parse them
    if category_params[:dynamic_fields] && category_params[:dynamic_fields][:field_name]
      dynamic_fields = category_params[:dynamic_fields][:field_name]
      fields_hash = dynamic_fields.each_with_object({}) do |field_name, hash|
        # Only add non-empty field names to the hash
        hash[field_name] = "" unless field_name.blank?
      end

      # Set the fields hash to the category
      @category.fields = fields_hash
    end

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def index
    @categories = current_user.categories
  end

  private

  def category_params
    params.require(:category).permit(:name, fields: {}, dynamic_fields: {})
  end
end
