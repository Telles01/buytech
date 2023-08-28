class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :payment
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
