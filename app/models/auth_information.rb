class AuthInformation < ApplicationRecord
  self.table_name = 'auth_informations'

  has_secure_password
  belongs_to :user
end
