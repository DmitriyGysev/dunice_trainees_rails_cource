class AddSlugToPhrase < ActiveRecord::Migration
  def change
    add_column :phrases, :slug, :string, :unique => true
  end
end
