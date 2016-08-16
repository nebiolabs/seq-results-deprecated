class CreateReadGroupProperties < ActiveRecord::Migration
  def change
    create_table :read_group_properties do |t|
      t.belongs_to :property, unique: true, foreign_key: true, null: false
#      t.integer :property_id, :null => false
      t.belongs_to :read_group, unique: true, foreign_key: true, null: false
#      t.integer :read_group_id, :null => false
      t.string :raw_value, :null => false
      t.float :numeric_value

      t.timestamps
    end

    add_index :read_group_properties, [:property_id, :read_group_id], unique: true

  end
end
