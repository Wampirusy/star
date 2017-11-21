class Subscription < ApplicationRecord
  self.table_name = 'commands_tournaments'
  
  belongs_to :command
end
