
class User < ActiveRecord::Base
  has_many :requirements
  has_many :assignments

  scope :authorized_user, lambda {|login_id, password|
      where(login_id: login_id, password: password)}
end