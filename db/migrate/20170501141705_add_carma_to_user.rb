class AddCarmaToUser < ActiveRecord::Migration
  def change
    add_column :users, :carma, :integer, default: 0
  end
end
