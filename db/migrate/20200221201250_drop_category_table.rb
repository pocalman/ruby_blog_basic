class DropCategoryTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :category
  end
end
