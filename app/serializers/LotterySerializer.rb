class LotterySerializer < ActiveModel::Serializer
  attributes :id, :result_jackpot, :status, :lottery_period, :number_of_spins_per_week, 

  def result_jackpot
    @resultTicketJackpot = object.lottery_ball_1.to_s + ' ' + object.lottery_ball_2.to_s + ' ' + 
    object.lottery_ball_3.to_s  + ' ' + object.lottery_ball_4.to_s  + ' ' +  
    object.lottery_ball_5.to_s + ' ' + object.lottery_ball_6.to_s + ' | ' + object.lottery_ball_extra.to_s
  end  
end
