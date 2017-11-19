class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :tournaments, :commands
  end
end
