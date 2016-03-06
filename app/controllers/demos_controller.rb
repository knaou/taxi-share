class DemosController < ApplicationController
  def load_test_data

    ActiveRecord::Base.transaction do
      AreaPoint.delete_all
      Area.delete_all
      Assignment.delete_all
      Requirement.delete_all
      User.delete_all


      areas = [Area.create(
          position: '戸塚駅'
      ),Area.create(
          position: '横浜駅'
      ),Area.create(
          position: '立場駅前'
      ),Area.create(
          position: '上大岡駅前'
      ),Area.create(
          position: '六ッ川寮'
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

      10.times do
        f = areas.sample()
        t = areas.sample()
        if t != f
          Requirement.create(
              status: 'INITIAL',
              user: users.sample(),
              from_area: f,
              to_area: t,
              from_point: f.points.sample(),
              to_point: t.points.sample()
          )
        end
      end

    end

    redirect_to root_path
  end
end