class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :handle_name, null: false
      t.integer :type, default: 1
      t.datetime :soft_destroyed_at

      t.timestamps
    end
    add_index :users, :soft_destroyed_at
  end
end
