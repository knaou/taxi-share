class AddDataToRequirement < ActiveRecord::Migration
  def change
    add_column :requirements, :date, :datetime
  end
end
