class Movie < ApplicationRecord

  has_many :screens
  has_many :tickets


  has_attached_file :image

end
