class Ticket < ApplicationRecord

  belongs_to :user
  has_one :movie
  has_one :seat
  has_one :hall
  has_many :order_items


end
