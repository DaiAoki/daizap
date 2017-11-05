class User < ApplicationRecord
  has_one  :auth_information, dependent: :destroy
  has_one  :user_information, dependent: :destroy
  has_many :records,          dependent: :destroy
  has_many :user_images,      dependent: :destroy

  enum role: { admin: 0, user: 1 }
end
