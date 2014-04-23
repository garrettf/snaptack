class AddDemo < ActiveRecord::Migration
  def change
    add_column :boards, :demo, :boolean, :default => false
    add_column :photos, :demo, :boolean, :default => false
    add_column :tacks,  :demo, :boolean, :default => false
  end
end
