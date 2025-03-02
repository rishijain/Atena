class CategoriesController < ApplicationController
  def new
    @category = current_user.categories.new
  end

  def create
    # Initialize the category with the name
    @category = current_user.categories.new(name: category_params[:name])

    debugger
    # Check if dynamic fields exist and parse them
    if category_params[:dynamic_fields] && category_params[:dynamic_fields][:field_name]
      dynamic_field_names = category_params[:dynamic_fields][:field_name]
      dynamic_field_types = category_params[:dynamic_fields][:field_type]
      fields_hash = dynamic_field_names.each_with_index.each_with_object({}) do |(field_name, index), hash|
        field_type = dynamic_field_types[index]
        # Only add non-empty field names to the hash
        hash[field_name] = field_type unless field_name.blank?
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
    # params.require(:category).permit(:name, :category_id, fields: {}, dynamic_fields: [:field_name, :field_type])
    params.require(:category).permit(:name, :category_id, fields: {}, dynamic_fields: {})
  end
end
