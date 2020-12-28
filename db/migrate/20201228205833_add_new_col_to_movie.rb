class AddNewColToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies ,:image ,:attachment
  end
end
