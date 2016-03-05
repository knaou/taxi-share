class Requirement < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :status
      t.integer :user_id

      t.integer :from_area_id, null: false
      t.integer :to_area_id, null: false
      t.integer :from_point_id
      t.integer :to_point_id

      t.timestamps
    end
  end
end
