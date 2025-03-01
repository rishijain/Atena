class RentAgreementsController < ApplicationController
  before_action :set_rent_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @rent_agreements = RentAgreement.all
  end

  def show
  end

  def new
    @rent_agreement = RentAgreement.new
  end

  def create
    @rent_agreement = RentAgreement.new(rent_agreement_params)
    if @rent_agreement.save
      redirect_to rent_agreements_url, notice: 'Rent agreement was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rent_agreement.update(rent_agreement_params)
      redirect_to @rent_agreement, notice: 'Rent agreement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rent_agreement.destroy
    redirect_to rent_agreements_url, notice: 'Rent agreement was successfully destroyed.'
  end

  private

  def set_rent_agreement
    @rent_agreement = RentAgreement.find(params[:id])
  end

  def rent_agreement_params
    params.require(:rent_agreement).permit(:name, :from, :to, :address, :owner_name, :owner_phone_number, :rent_amount, :deposit)
  end
end
