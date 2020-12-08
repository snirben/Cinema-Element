class CreateHalls < ActiveRecord::Migration[6.0]
  def change
    create_table :halls do |t|
      t.string :title,:default=>""
      t.integer :hall_num,null:false
      t.integer :floor,:default=>0
      t.timestamps
    end
  end
end
