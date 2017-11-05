class UserImage < ApplicationRecord
  belongs_to :user

  enum role: { main: 0, sub: 1 }
end
