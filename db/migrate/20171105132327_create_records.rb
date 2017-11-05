class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :image
      t.decimal :weight
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
