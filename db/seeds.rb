# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing records
RentAgreement.destroy_all

# Create sample rent agreements
RentAgreement.create([
  {
    from: DateTime.now,
    to: DateTime.now + 1.month,
    address: '123 Main St, Springfield',
    owner_name: 'John Doe',
    owner_phone_number: '555-1234',
    rent_amount: 1200.00,
    deposit: 1200.00,
    name: 'John Doe Rent Agreement'  # Added name field
  },
  {
    from: DateTime.now,
    to: DateTime.now + 6.months,
    address: '456 Elm St, Springfield',
    owner_name: 'Jane Smith',
    owner_phone_number: '555-5678',
    rent_amount: 1500.00,
    deposit: 1500.00,
    name: 'Jane Smith Rent Agreement'  # Added name field
  },
  {
    from: DateTime.now,
    to: DateTime.now + 1.year,
    address: '789 Oak St, Springfield',
    owner_name: 'Alice Johnson',
    owner_phone_number: '555-8765',
    rent_amount: 1800.00,
    deposit: 1800.00,
    name: 'Alice Johnson Rent Agreement'  # Added name field
  }
])
