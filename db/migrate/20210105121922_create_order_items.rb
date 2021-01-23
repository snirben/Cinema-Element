class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :seat_id
      t.integer :order_id
      t.decimal :unit_price
      t.timestamps
    end
  end
end
