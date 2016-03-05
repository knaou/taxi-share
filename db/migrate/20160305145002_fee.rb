class Fee < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :point1_id
      t.integer :point2_id

      t.timestamps
    end
  end
end
