
class Area < ActiveRecord::Base
  has_many :points, class_name: 'AreaPoint', foreign_key: 'area_id'
end
