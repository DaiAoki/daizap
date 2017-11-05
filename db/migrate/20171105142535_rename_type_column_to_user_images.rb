class RenameTypeColumnToUserImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_images, :type, :image_type
  end
end
