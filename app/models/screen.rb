class Screen < ApplicationRecord

  belongs_to :movie
  belongs_to :hall
  belongs_to :seat, optional: true
end
