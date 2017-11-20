class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :tournaments, :commands
    
    change_table(:commands_tournaments) do |t|
      t.timestamps
    end
    
    add_index :commands_tournaments, [:tournament_id, :command_id], unique: true
  end
end
