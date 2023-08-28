class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :units
      t.float :price
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
