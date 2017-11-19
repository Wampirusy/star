class Command < ApplicationRecord
  belongs_to :user

  def logo= file
    # p  '----',@file,super.@file,"-----#{file}------",self
    # @file = file.read
    super Base64.encode64(file.read)
  end
end
