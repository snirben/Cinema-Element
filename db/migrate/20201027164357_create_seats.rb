class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.boolean :is_taken,null:false,:default=>false
      t.integer :hall_id,null:false

      t.timestamps
    end
  end
end
