class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
  belongs_to :tea
  belongs_to :customer

  enum :status, { active: 1, cancelled: 2 }
end
