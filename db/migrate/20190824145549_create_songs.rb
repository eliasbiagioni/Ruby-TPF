class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
