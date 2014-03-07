class CreateTacks < ActiveRecord::Migration
  def change
    create_table :tacks do |t|
      t.string :name, limit: 256
      t.text :description
      t.integer :top
      t.integer :left
      t.references :board, index: true

      t.timestamps
    end
  end
end
