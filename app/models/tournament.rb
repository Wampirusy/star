class Tournament < ApplicationRecord
  has_and_belongs_to_many :commands
  
  validates :commands, uniqueness: true

  def has_command?(command)
    commands.where({:id => command}).any?
  end
    
  def sign_in(command)      
    if self.commands.include?(command)
        false
      else
        self.commands << command
      end
    
  end
  
  def sign_out(command)
    self.commands.delete(command)
  end
end
