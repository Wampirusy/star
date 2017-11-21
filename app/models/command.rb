require 'mini_magick'

class Command < ApplicationRecord
  belongs_to :user
  has_one :subscription
  
  validates :name, uniqueness: true

  def logo= file
    image = MiniMagick::Image.read file.read
    image.resize '200x200'

    super Base64.encode64(image.to_blob)
  end
end
