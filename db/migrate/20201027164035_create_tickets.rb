class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.intger :user_id,null:false
      t.intger :movie_id,null:false
      t.intger :screen_id,null:false
      t.intger :seat_id,null:false
      t.intger :hall_id,null:false
      t.timestamps
    end
  end
end
