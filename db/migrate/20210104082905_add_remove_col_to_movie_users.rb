class AddRemoveColToMovieUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users ,:admin ,:boolean
    remove_column :movies, :admin

  end
end
