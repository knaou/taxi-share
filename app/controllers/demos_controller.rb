class DemosController < ApplicationController
  def load_test_data

    ActiveRecord::Base.transaction do
      AreaPoint.delete_all
      Area.delete_all
      User.delete_all

      areas = [Area.create(
         position: '戸塚駅東口'
      ),Area.create(
          position: '戸塚駅西口'
      ),Area.create(
          position: '立場駅前'
      ),Area.create(
          position: '上大岡駅前'
      )]

      areas.each do |area|
        [*1..3].each do |n|
          AreaPoint.create( area: area, position: "#{area.position}##{n}")
        end
      end

      users = [
          User.create(name: '一番絞り', login_id: 'itiban', password: 'pass'),
          User.create(name: '姫', login_id: 'hime', password: 'pass'),
          User.create(name: 'アーサー', login_id: 'asa', password: 'pass'),
          User.create(name: 'ゲスト', login_id: 'guest', password: 'pass')
      ]

    end

    redirect_to root_path
  end
end