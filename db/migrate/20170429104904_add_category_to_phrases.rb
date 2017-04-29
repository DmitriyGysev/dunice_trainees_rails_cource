class AddCategoryToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :category, :integer, default: 0
  end
end
