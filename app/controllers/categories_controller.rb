class CategoriesController < ApplicationController
  def new
    @category = current_user.categories.new
  end

  def create
    # Initialize the category with the name
    @category = current_user.categories.new(name: category_params[:name])

    # Parse dynamic fields and create a new hash
    dynamic_fields = category_params[:dynamic_fields][:field_name]
    fields_hash = dynamic_fields.each_with_object({}) do |field_name, hash|
      # Only add non-empty field names to the hash
      hash[field_name] = "String" unless field_name.blank?
    end

    debugger
    # Set the fields hash to the category
    @category.fields = fields_hash

    if @category.save
      redirect_to new_category_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, fields: {}, dynamic_fields: {})
  end
end
