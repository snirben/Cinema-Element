class CreateBuyfeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyfeedbacks do |t|
      t.text :name
      t.text :message
      t.timestamps
    end
  end
end
