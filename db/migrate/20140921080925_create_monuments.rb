class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.text :description
      t.belongs_to :monument_group, null: false
      t.timestamps
    end
    add_index :monuments, :monument_group_id
  end
end
