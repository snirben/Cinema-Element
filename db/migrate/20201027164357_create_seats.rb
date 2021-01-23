class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.boolean :is_taken,null:false,:default=>false
      t.boolean :is_free,:default=>true
      t.integer :hall_id,null:false
      t.datetime :taken_at
      t.integer :seat_num
      t.integer :ticket_id
      t.integer :screen_id
      t.timestamps
    end
  end
end
