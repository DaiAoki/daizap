# STI(Single Table Inheritance)
class Record < ApplicationRecord
  belongs_to :user

  enum type: { weight: 'Record::Weight', image: 'Record::Image' }

  def brothers
    Record.where(user_id: self.user_id)
  end
end
