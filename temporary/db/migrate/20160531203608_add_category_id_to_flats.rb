class AddCategoryIdToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :category_id, :integer
  end
end
