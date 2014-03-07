class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :tack, index: true
      t.string :title, limit: 256
      t.text :description
      t.integer :number

      t.timestamps
    end
  end
end
