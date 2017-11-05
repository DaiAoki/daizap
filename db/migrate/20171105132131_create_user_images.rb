class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.integer :type, default: 0
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
