class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :marvel_id
      t.string :name
      t.text :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
