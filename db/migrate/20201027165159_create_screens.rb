class CreateScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :screens do |t|
      t.integer :movie_id
      t.datetime :screen_at
      t.integer :hall_id
      t.timestamps
    end
  end
end
