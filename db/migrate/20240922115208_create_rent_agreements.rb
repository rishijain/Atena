class CreateRentAgreements < ActiveRecord::Migration[7.1]
  def change
    create_table :rent_agreements do |t|
      t.string :name
      t.datetime :from
      t.datetime :to
      t.string :address
      t.string :owner_name
      t.string :owner_phone_number
      t.float :rent_amount
      t.float :deposit

      t.timestamps
    end
  end
end
