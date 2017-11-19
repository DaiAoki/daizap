class RemoveTypeFromRecords < ActiveRecord::Migration[5.0]
  def change
    remove_column(:records, :type)
  end
end
