class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, index: true
      t.references :chatroom, index: true


      t.timestamps
    end
  end
end
