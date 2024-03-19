class ManagementResultController < ApplicationController
  include ActiveModel::Serialization

  def index
    @results = Lottery.all
    render json: { 
      status: 200, 
      msg: "Get data successfully", 
      data: ActiveModel::Serializer::CollectionSerializer.new(@results, each_serializer: LotterySerializer) 
    }
  end

  def create
    begin  
      @lotteryResult = Lottery.new(lottery_params)
      @lotteryResult.save
      if @lotteryResult.save
        render json: {
          status: 200,
          msg: 'Create data sussces'
        }
      else
        render json: {
          status: 400,
          error: @lotteryResult.errors.full_messages,
          msg: 'Have error'
        }   
      end
    end  
      rescue StandardError => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
  end  

  private
  
  def lottery_params
    params.permit(:lottery_ball_1,:lottery_ball_2,:lottery_ball_3,:lottery_ball_4,:lottery_ball_5,:lottery_ball_6, 
      :lottery_ball_extra, :status, :lottery_period, :number_of_spins_per_week)
  end  
end
