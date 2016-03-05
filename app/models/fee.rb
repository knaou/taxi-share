
class Fee < ActiveRecord::Base
  belongs_to :point1, class_name: 'AreaPoint', foreign_key: :point1_id
  belongs_to :point2, class_name: 'AreaPoint', foreign_key: :point2_id
end