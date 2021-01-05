class AddfieldstoMovieTable < ActiveRecord::Migration[6.0]
  def change
    add_column :movies ,:age_limit ,:integer
    add_column :movies ,:price ,:decimal,:precision => 8, :scale => 2
    add_column :movies ,:old_price ,:decimal,:precision => 8, :scale => 2
    add_column :movies,:category ,:string
    add_column :movies ,:director ,:string
    add_column :movies ,:rating ,:string
    add_column :movies ,:description ,:text
    add_column :movies ,:movie_length ,:integer

  end
end
