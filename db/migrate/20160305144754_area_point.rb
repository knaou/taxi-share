class AreaPoint < ActiveRecord::Migration
  def change
    create_table :area_points do |t|
      t.integer :area_id
      t.string :position
    end
  end
end
