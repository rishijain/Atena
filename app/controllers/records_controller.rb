class RecordsController < ApplicationController
  before_action :set_category
  # before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @records = @category.records
    @record = @category.records.build  # For the new record form
  end

  def new
    @record = @category.records.build
  end

  def create
    @record = @category.records.build(record_params)
    @record.user = current_user
    
    if @record.save
      redirect_to category_records_path(@category), notice: 'Record was successfully created.'
    else
      @records = @category.records
      render :index
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_record
    @record = @category.records.find(params[:id])
  end

  def record_params
    permitted_fields = @category.fields.keys
    data_params = params.require(:record).permit(*permitted_fields)
    { data: data_params }
  end
end