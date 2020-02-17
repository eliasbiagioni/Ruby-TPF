class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :isbn, null: false, unique: true
      t.string :author, null: false
      t.string :editorial, null: false
      t.text :summary, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
