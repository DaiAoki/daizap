class CreateUserInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_informations do |t|
      t.integer :gender
      t.decimal :height
      t.decimal :weight
      t.string :residence
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
