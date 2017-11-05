class CreateAuthInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_informations do |t|
      t.string :login_id, unique: true
      t.string :password_digest
      t.string :secret_question
      t.string :secret_answer
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
