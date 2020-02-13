class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :game_id 
      t.integer :player_id 
      t.string :gamer_tag
    end
  end
end
