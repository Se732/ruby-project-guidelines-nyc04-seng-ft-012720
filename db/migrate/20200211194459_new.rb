class New < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :genre, :string 
  end
end
