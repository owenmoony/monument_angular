class CategoriesMonuments < ActiveRecord::Migration
  def change
    create_table :categories_monuments, id: false do |t|
        t.belongs_to :category
        t.belongs_to :monument
      end
      add_index :categories_monuments, :category_id
      add_index :categories_monuments, :monument_id
  end
end
