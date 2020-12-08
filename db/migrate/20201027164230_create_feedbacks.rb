class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :movie_id
      t.integer :user_id
      t.string :review
      t.timestamps
    end
  end
end
