class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name, limit: 256
      t.text :description
      t.integer :width
      t.integer :height
      t.references :user, index: true

      t.timestamps
    end
  end
end
