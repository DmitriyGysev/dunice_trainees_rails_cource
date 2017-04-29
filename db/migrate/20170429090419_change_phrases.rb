class ChangePhrases < ActiveRecord::Migration
  def change
    remove_column :phrases, :translate
    add_column :phrases, :translation, :string

  end
end
