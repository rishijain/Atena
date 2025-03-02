class SetDefaultValueForDataInRecords < ActiveRecord::Migration[7.0]
  def change
    change_column_default :records, :data, from: nil, to: {}
  end
end
