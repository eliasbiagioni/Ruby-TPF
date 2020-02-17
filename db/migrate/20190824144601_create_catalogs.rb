class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :name, null: false
      t.boolean :privacy, null: true, default: false

      t.timestamps
      
    end
  end
end
