class Category < ApplicationRecord
  belongs_to :user
  has_many :records

  # serialize :fields, JSON

  def add_field(name, type)
    self.fields ||= {}
    self.fields[name] = type
    save
  end

  def remove_field(name)
    self.fields.delete(name)
    save
  end
end