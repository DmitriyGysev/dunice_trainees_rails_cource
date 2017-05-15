class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.references :owner, references: :users, index: true
      t.references :recipient, references: :users, index: true

      t.timestamps
    end
  end
end
