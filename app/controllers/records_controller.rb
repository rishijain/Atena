class RecordsController < ApplicationController
    def new
      @category = Category.find(params[:category_id])
      @record = @category.records.build
    end
  
    def create
      @category = Category.find(params[:category_id])
      @record = @category.records.build(record_params)
      @record.user = current_user
  
      # Initialize the data hash
      @record.data = {}
  
      # Populate the data hash with values from the form
      @category.fields.each do |field_name, field_type|
        @record.data[field_name] = params[:record][:data][field_name]
      end
  
      if @record.save
        redirect_to @record, notice: 'Record was successfully created.'
      else
        render :new
      end
    end

    def index
      @category = Category.find(params[:category_id])
      @records = @category.records
    end
  
    private
  
    def record_params
      params.require(:record).permit(:category_id)
    end
  end