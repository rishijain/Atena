class Record < ApplicationRecord
  belongs_to :category
  belongs_to :user

  serialize :data, JSON
end