require 'mini_magick'
class Command < ApplicationRecord
  belongs_to :user

  def logo= file

    image = MiniMagick::Image.read file.read
    p '???', image.data
    image.resize '200'
    # image.crop '200x200+10+5'

    # p  '----',@file,super.@file,"-----#{file}------",self
    # @file = file.read
    p '!!!!',  image

    super Base64.encode64(image.to_blob)



    # super Base64.encode64(file.read)
  end
end
