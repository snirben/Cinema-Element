class AddfieldstoMovieTable < ActiveRecord::Migration[6.0]
  def change
    add_column :movies ,:age_limit ,:integer
    add_column :movies ,:price ,:integer,:default => 0
    add_column :movies ,:old_price ,:integer,:default=>0
    add_column :movies,:category ,:string,:default => nil
    add_column :movies ,:director ,:string
    add_column :movies ,:rating ,:string
    add_column :movies ,:description ,:text
    add_column :movies ,:movie_length ,:integer
    add_column :movies ,:category_id ,:integer
    add_column :movies , :booked_counter, :integer,:default => 0
  end
end
