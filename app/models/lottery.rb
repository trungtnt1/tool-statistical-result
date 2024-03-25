class Lottery < ApplicationRecord
  require 'date'
  self.table_name = "lottery_managerments"
  validates :lottery_ball_1, numericality: true, presence: true
  validates :lottery_ball_2, numericality: true, presence: true
  validates :lottery_ball_3, numericality: true, presence: true
  validates :lottery_ball_4, numericality: true, presence: true
  validates :lottery_ball_5, numericality: true, presence: true
  validates :lottery_ball_6, numericality: true, presence: true
  validates :status, numericality: true, presence: true
  validates :lottery_period, presence: true, uniqueness: true
  validates :number_of_spins_per_week, presence: true, numericality: true
  
  validate :is_date, :ball_extra, :value_balls_not_overlaps, :value_balls_not_accepted, :check_status, 
  :check_period_draw, :check_date_valid

  private

  def is_date
    if lottery_period.present? && !lottery_period.is_a?(Date)
      errors.add(:lottery_period, "must be a valid date and must be a format yyyy-mm-dd")
    end   
  end

  # Value ball extra require when status = 6/55
  def ball_extra
    if status == JACKPOT_6_45 && lottery_ball_extra.present?
      errors.add(:lottery_ball_extra, "not need this parameters when the lottery is 6/45")
    end  
    if status == JACKPOT_6_55 && lottery_ball_extra == nil
      errors.add(:lottery_ball_extra, "lottery ball extra can't be blank")
    end
    if status == JACKPOT_6_55 && lottery_ball_extra.present? && (lottery_ball_extra == 0 || lottery_ball_extra > JACKPOT_6_55) 
      errors.add(:lottery_ball_extra, "lottery ball extra is invalid")
    end  
  end  

  # Check value balls can't overlaps
  def value_balls_not_overlaps
    unless [lottery_ball_1,lottery_ball_2,lottery_ball_3,lottery_ball_4,
      lottery_ball_5,lottery_ball_6,lottery_ball_extra].uniq.length == 7
      errors.add(:base, "The lottery value balls can not overlaps")
    end
  end
  
  # Check value ball accepted
  def value_balls_not_accepted
    @result = [lottery_ball_1, lottery_ball_2, lottery_ball_3, lottery_ball_4, lottery_ball_5, lottery_ball_6]
    
    if status == JACKPOT_6_55 && @result.any? { |value| 0 == value || value > JACKPOT_6_55 }
      errors.add(:base, "At least one value ball for Lottery 6/55 is invalid")
    end
  
    if status == JACKPOT_6_45 && @result.any? { |value|  0 == value || value > JACKPOT_6_45 }
      errors.add(:base, "At least one value ball for Lottery 6/45 is invalid")
    end
  end
  
  # Check type is lottery 6/55 or lottery 6/45
  def check_status
    unless status == JACKPOT_6_55 || status == JACKPOT_6_45
      errors.add(:base, "The status is not accepted")
    end  
  end 
  
  # Check period draw accepted
  def check_period_draw
    unless [DRAW_BEGINING_WEEK, DRAW_BETWEEN_WEEK, DRAW_END_WEEK].include?(number_of_spins_per_week)
      errors.add(:base, "The period draw in week is not valid")
    end 
  end

  def check_date_valid
    if lottery_period.present? && Date.today < lottery_period 
      errors.add(:lottery_period, "The jackpot drawing date is a date in the past or present, not the future")
    end   
  end    
  
  # Constants

  # Type
  JACKPOT_6_55 = 55
  JACKPOT_6_45 = 45
  # Period draw
  DRAW_BEGINING_WEEK = 1
  DRAW_BETWEEN_WEEK = 2
  DRAW_END_WEEK = 3
  # Have query 
  USE_HAVE_QUERIES = 1,
  NOT_USE_QUERY = 0
end
