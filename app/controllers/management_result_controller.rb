class ManagementResultController < ApplicationController
  include ActiveModel::Serialization
  def index
    total = Lottery.count 
    page = params[:page].present? && params[:page].is_a?(Numeric) ? params[:page] : 1
    per_page = params[:page].present? && params[:page].is_a?(Numeric) ? params[:per_page] : total
    @results = Lottery.order(id: :desc).all.paginate(
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
  
  def generateLuckyDraw
    if !(convertParams(params[:type]) == Lottery::JACKPOT_6_55 || convertParams(params[:type]) == Lottery::JACKPOT_6_45)
      render json: {
        msg: 'Wrong params !'
      }
    else   
      luckyNumber = randomNumber(params[:type])
      obj = {
        result: luckyNumber.to_json,
        jackpot_type: convertParams(params[:type]) == Lottery::JACKPOT_6_55 ? "Jackpot 6/55" : "Jackpot 6/45",
        status: Lottery::NOT_USE_QUERY
      }
      @generateNumber = GenerateNumber.new(obj)
      @generateNumber.save
      render json: {
        data: luckyNumber,
        msg: 'Good luck with your lucky numbers !'
      }
    end    
  end
  
  def generateLuckyDrawRule
    if !(convertParams(params[:type]) == Lottery::JACKPOT_6_55 || convertParams(params[:type]) == Lottery::JACKPOT_6_45)
      render json: {
        msg: 'Wrong params !'
      }
    else   
      conditions = handleConditions(
        convertParams(params[:type]), 
        convertParams(params[:draw_week]))
        
        if getNumbersOccurrence(conditions).empty?
          render json: 
          {
            msg: 'Data not found', 
            status: 404,
          }
        else
          listNumbers = getNumbersOccurrence(conditions).map { |obj| obj[:value] }
          randomLuckyDraw = listNumbers.sample(6).sort
          obj = {
            result: randomLuckyDraw.to_json,
            jackpot_type: convertParams(params[:type]) == Lottery::JACKPOT_6_55 ? "Jackpot 6/55" : "Jackpot 6/45",
            status: Lottery::USE_HAVE_QUERIES
          }        
          @generateNumber = GenerateNumber.new(obj)
          @generateNumber.save
          render json: 
          {
            data: randomLuckyDraw,
            msg: 'Good luck with your lucky numbers !',
            status: 200
          }
        end
    end
  end 
  
  def compareResultJackpot
    drawing = Lottery.where(lottery_period: params[:date]).first
    if !drawing.blank? && (
      convertParams(params[:type]) == Lottery::JACKPOT_6_55 || convertParams(params[:type]) == Lottery::JACKPOT_6_45)
      if convertParams(params[:type]) == Lottery::JACKPOT_6_55
        generateData = GenerateNumber.where(
          "created_at LIKE ? OR created_at LIKE ?",
          "%#{drawing.lottery_period}%",
          "%#{drawing.lottery_period.prev_day}%"
        ).where(jackpot_type: "Jackpot 6/55" )
      else
        generateData = GenerateNumber.where(
          "created_at LIKE ?",
          "%#{drawing.lottery_period}%"
        ).where(jackpot_type: "Jackpot 6/45")
      end  
      generateResults = generateData.map { |item| item[:result] }
      resultJackpot = []
      resultJackpot.push(
        drawing.lottery_ball_1,
        drawing.lottery_ball_2,
        drawing.lottery_ball_3,
        drawing.lottery_ball_4,
        drawing.lottery_ball_5,
        drawing.lottery_ball_6
      )
      generateResults.map! {|r| r.scan(/\d+/).map(&:to_i) }
      
      count = Hash.new(0)
      generateResults.each do |subArray|
        subArray.each do |num|
          count[num] += 1 if resultJackpot.include?(num)
        end
      end
      resultMatch = []
      generateResults.each_with_index do |subArray, index|
        countInJackpot = 0
        subArray.each do |num|
          countInJackpot += 1 if count[num] >= 3
        end
        resultMatch << index if countInJackpot >= 3
      end
      ticketPrizes = resultMatch.map { |index| { ticket: generateResults[index] }}
      if ticketPrizes.blank?
        render json: {
          data: ticketPrizes,
          msg: 'You have no ticket win prize',
          status: 200
        }
      else
        render json: {
          data: ticketPrizes,
          msg: "You have #{ticketPrizes.count} #{ticketPrizes.count > 1 ? 'tickets' : 'ticket'} win prize",
          status: 200
        }
      end    
    else  
      render json: {
        data: '',
        msg: 'The corresponding draw date could not be found',
        status: 404
      }
    end  
  end   

  private
  
  def getNumbersOccurrence(conditions)
    frequency = params[:frequency].present? && convertParams(params[:frequency]) > 0 ? 
      convertParams(params[:frequency]) : 2  
    limitData = params[:limit].present? && convertParams(params[:limit]) > 0 ? params[:limit] : nil
    
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
    .having("COUNT(*) >= ?",frequency)
    .order("count DESC")
    .limit(limitData)
    
    if numbers.empty? 
      {}
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
  
  def randomNumber(type)
    luckyNumbers = []
  
    if type.to_i == Lottery::JACKPOT_6_45
      range = Lottery::JACKPOT_6_45
    else
      range = Lottery::JACKPOT_6_55
    end
    
    while luckyNumbers.length < 6
      random_number = rand(1..range)
      unless luckyNumbers.include?(random_number)
        luckyNumbers << random_number
      end
    end
    
    return luckyNumbers.sort
  end  

  def lottery_params 
    params.permit(:lottery_ball_1,:lottery_ball_2,:lottery_ball_3,:lottery_ball_4,:lottery_ball_5,:lottery_ball_6, 
      :lottery_ball_extra, :status, :lottery_period, :number_of_spins_per_week)
  end
end
