class Area < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :position
      t.timestamps
    end
  end
end
