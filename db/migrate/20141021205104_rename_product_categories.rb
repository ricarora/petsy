class RenameProductCategories < ActiveRecord::Migration
  def change
    rename_table :product_categories, :productcategories
  end
end
