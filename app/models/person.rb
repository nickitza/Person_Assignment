class Person < ApplicationRecord
  has_many :quotes, dependent: :destroy


  validates :first_name, presence: true

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end


end
