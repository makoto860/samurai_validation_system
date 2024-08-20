class Room < ApplicationRecord
  has_many :rents
  validates :name, presence: true
  validates :amount, presence: true

  def rents_new
    rents.new
  end
end
