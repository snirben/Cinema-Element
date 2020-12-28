class AddDesctoMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies ,:description ,:text
    add_column :movies ,:movie_length ,:integer
  end
end
