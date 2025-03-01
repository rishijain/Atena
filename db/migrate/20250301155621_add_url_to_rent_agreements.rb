class AddUrlToRentAgreements < ActiveRecord::Migration[7.1]
  def change
    add_column :rent_agreements, :url, :string
  end
end
