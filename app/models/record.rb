# STI(Single Table Inheritance)
class Record < ApplicationRecord
  belongs_to :user
  validates :type, presence: true

  # Cannot use with STI in Rails5.
  # TODO: research how I can use enum with STI
  #enum type: { weight: 'Record::Weight', image: 'Record::Image' }

  def brothers
    Record.where(user_id: self.user_id)
  end
end
