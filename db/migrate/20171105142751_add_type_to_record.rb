class AddTypeToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :type, :string
  end
end
