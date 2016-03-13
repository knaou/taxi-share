class RemoveDateTemporary < ActiveRecord::Migration
  def change
    remove_column :requirements, :date
  end
end
