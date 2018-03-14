class AddColumnsToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :face, :string
    add_column :clubs, :drink, :string
    add_column :clubs, :people, :string
    add_column :clubs, :twitter_id, :string
  end
end
