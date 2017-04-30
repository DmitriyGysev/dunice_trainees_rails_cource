class AddUserRelationToPhrases < ActiveRecord::Migration
  def change
    add_reference :phrases, :user, foreign_key: true
  end
end
