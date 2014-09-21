class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :owner
      t.timestamps
    end
    add_index :categories, :owner_id
  end
end
