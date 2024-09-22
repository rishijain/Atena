class RentAgreement < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true
  validates :address, presence: true
  validates :owner_name, presence: true
  validates :rent_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :deposit, numericality: { greater_than_or_equal_to: 0 }
  
end
