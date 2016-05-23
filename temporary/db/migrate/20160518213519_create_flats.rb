class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.text :discription
      t.integer :plz
      t.string :town

      t.timestamps null: false
    end
  end
end
