class LotterySerializer < ActiveModel::Serializer
  attributes :id, :lottery_ball_1,:lottery_ball_2,:lottery_ball_3,:lottery_ball_4,:lottery_ball_5,:lottery_ball_6, 
  :lottery_ball_extra, :status, :lottery_period, :number_of_spins_per_week
end
