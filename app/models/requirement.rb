
class Requirement < ActiveRecord::Base
  belongs_to :from_area, class: 'Area', foreign_key: :from_area_id
  belongs_to :to_area, class: 'Area', foreign_key: :to_area_id
  belongs_to :from_point, class: 'AreaPoint', foreign_key: :from_point_id
  belongs_to :to_point, class: 'AreaPoint', foreign_key: :to_point_id
  belongs_to :user
end