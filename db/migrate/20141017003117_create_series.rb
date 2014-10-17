class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.integer :series_id
      t.text :description
      t.integer :start_year
      t.integer :end_year
      t.string :rating
      t.string :thumbnail
      t.text :creators
      t.text :characters

      t.timestamps
    end
  end
end
