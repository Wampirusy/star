class Tournament < ApplicationRecord
  has_and_belongs_to_many :commands

  def has_command? command
    commands.where({:id => command}).any?
  end
end
