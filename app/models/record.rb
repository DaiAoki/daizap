# STI(Single Table Inheritance)
class Record < ApplicationRecord
  belongs_to :user

  def sibling
    Record.where(user_id: self.user_id)
  end
end
