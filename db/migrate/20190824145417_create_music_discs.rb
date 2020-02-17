class CreateMusicDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :music_discs do |t|
      t.string :title, null: false
      t.string :discography, null: false
      t.string :group_name, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
