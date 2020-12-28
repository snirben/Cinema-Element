class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id,null:false
      t.integer :movie_id,null:false
      t.integer :screen_id,null:false
      t.integer :seat_id,null:false
      t.integer :hall_id,null:false
      t.timestamps
    end
  end
end
