class ChangeNameIsRetired < ActiveRecord::Migration
  def change
    rename_column :products, :is_active, :is_retired
  end
end
