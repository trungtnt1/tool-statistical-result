class ManagementResultController < ApplicationController
  include ActiveModel::Serialization

  def index
    total = Lottery.count 
    page = params[:page].present? && params[:page].is_a?(Numeric) ? params[:page] : 1
    per_page = params[:page].present? && params[:page].is_a?(Numeric) ? params[:per_page] : total
    @results = Lottery.all.paginate(
      :page => page, 
      :per_page => per_page
    )
    render json: { 
      status: 200, 
      msg: "Get data successfully", 
      data: ActiveModel::Serializer::CollectionSerializer.new(@results, each_serializer: LotterySerializer),
      pages: {
        page: page,
        per_page: per_page,
        total_items: total
      }
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
  
  def getRateStatistics
    conditions = handleConditions(
      convertParams(params[:type]), 
      convertParams(params[:draw_week]))
    data = getNumbersOccurrence(conditions)
    render json: { data: data }
  end  

  private
  
  def getNumbersOccurrence(conditions)
    
    numbers = Lottery.select("value, COUNT(*) AS count")
    .from("(SELECT lottery_ball_1 AS value FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_2 FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_3 FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_4 FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_5 FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_6 FROM lottery_managerments WHERE #{conditions}
           UNION ALL SELECT lottery_ball_extra FROM lottery_managerments 
           WHERE lottery_ball_extra IS NOT NULL AND #{conditions}
           ) AS all_values")
    .group("value")
    .having("COUNT(*) > 1")
    .order("count DESC")
    .limit(params[:limit].present? && params[:limit].is_a?(Numeric) ? params[:limit] : nil)
    
    if numbers.empty? 
      {
        msg: 'Data not found',
        status: 404
      }
    else
      formatted_results = numbers.map do |result|
        value = result.value
        occurrence_count = result.count
        { value: value, occurrence_count: occurrence_count }
      end
    end
  end

  def handleConditions(type,draw_week)
    conditions = []
    
    if type.present?
      conditions << "status = #{type}"
    end

    if draw_week.present?
      conditions << "number_of_spins_per_week = '#{draw_week}'"
    end
  
    if conditions.empty?
      "1 = 1"
    else
      conditions.join(" AND ")
    end
  end
  
  def convertParams(param)
    convert = param.to_i
    convert.is_a?(Numeric) && convert > 0 ? convert : nil
  end  

  def lottery_params
    params.permit(:lottery_ball_1,:lottery_ball_2,:lottery_ball_3,:lottery_ball_4,:lottery_ball_5,:lottery_ball_6, 
      :lottery_ball_extra, :status, :lottery_period, :number_of_spins_per_week)
  end
end
