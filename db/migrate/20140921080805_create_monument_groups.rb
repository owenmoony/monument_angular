class CreateMonumentGroups < ActiveRecord::Migration
  def change
    create_table :monument_groups do |t|
      t.string :name
      t.belongs_to :owner
      t.timestamps
    end
    add_index :monument_groups, :owner_id
  end
end
