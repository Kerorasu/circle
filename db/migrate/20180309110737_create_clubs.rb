class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :big_genre
      t.string :small_genre
      t.integer :frequency
      t.string :place
      t.text :pr

      t.timestamps null: false
    end
  end
end
