
class User < ActiveRecord::Base
  has_many :requirements
  has_many :assignments
end