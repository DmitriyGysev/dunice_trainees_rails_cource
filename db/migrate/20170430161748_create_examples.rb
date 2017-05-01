class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :example
      t.references :user
      t.references :phrase

      t.timestamps null: false
    end
  end
end
