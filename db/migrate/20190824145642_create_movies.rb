class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :actors, null: false
      t.text :directors, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
