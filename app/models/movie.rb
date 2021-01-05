class Movie < ApplicationRecord

  has_many :screens
  has_many :tickets


  has_attached_file :blob, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :blob, :content_type => /\Aimage\/.*\Z/

end
