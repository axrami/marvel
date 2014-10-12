class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.integer :comic_id
      t.string :name
      t.text :description
      t.string :thumbnail


      t.timestamps
    end
  end
end
