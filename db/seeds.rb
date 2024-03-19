# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lottery.create!([
  # 6/55
  {
    lottery_ball_1: 8,
    lottery_ball_2: 36,
    lottery_ball_3: 42,
    lottery_ball_4: 43,
    lottery_ball_5: 44,
    lottery_ball_6: 55,
    lottery_ball_extra: 54,
    lottery_period: "2024-03-16",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 21,
    lottery_ball_2: 25,
    lottery_ball_3: 26,
    lottery_ball_4: 29,
    lottery_ball_5: 41,
    lottery_ball_6: 51,
    lottery_ball_extra: 39,
    lottery_period: "2024-03-14",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 11,
    lottery_ball_2: 14,
    lottery_ball_3: 18,
    lottery_ball_4: 20,
    lottery_ball_5: 22,
    lottery_ball_6: 43,
    lottery_ball_extra: 16,
    lottery_period: "2024-03-12",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 11,
    lottery_ball_2: 13,
    lottery_ball_3: 22,
    lottery_ball_4: 36,
    lottery_ball_5: 46,
    lottery_ball_6: 49,
    lottery_ball_extra: 37,
    lottery_period: "2024-03-09",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 13,
    lottery_ball_2: 20,
    lottery_ball_3: 33,
    lottery_ball_4: 47,
    lottery_ball_5: 53,
    lottery_ball_6: 54,
    lottery_ball_extra: 19,
    lottery_period: "2024-03-07",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 12,
    lottery_ball_2: 19,
    lottery_ball_3: 21,
    lottery_ball_4: 23,
    lottery_ball_5: 28,
    lottery_ball_6: 54,
    lottery_ball_extra: 31,
    lottery_period: "2024-03-05",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 1,
    lottery_ball_2: 19,
    lottery_ball_3: 21,
    lottery_ball_4: 31,
    lottery_ball_5: 50,
    lottery_ball_6: 55,
    lottery_ball_extra: 37,
    lottery_period: "2024-03-02",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 4,
    lottery_ball_2: 11,
    lottery_ball_3: 20,
    lottery_ball_4: 38,
    lottery_ball_5: 52,
    lottery_ball_6: 53,
    lottery_ball_extra: 33,
    lottery_period: "2024-02-29",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 1,
    lottery_ball_2: 4,
    lottery_ball_3: 6,
    lottery_ball_4: 8,
    lottery_ball_5: 24,
    lottery_ball_6: 35,
    lottery_ball_extra: 53,
    lottery_period: "2024-02-27",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 1,
    lottery_ball_2: 3,
    lottery_ball_3: 22,
    lottery_ball_4: 27,
    lottery_ball_5: 38,
    lottery_ball_6: 40,
    lottery_ball_extra: 26,
    lottery_period: "2024-02-24",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 8,
    lottery_ball_2: 19,
    lottery_ball_3: 24,
    lottery_ball_4: 31,
    lottery_ball_5: 35,
    lottery_ball_6: 55,
    lottery_ball_extra: 1,
    lottery_period: "2024-02-22",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 34,
    lottery_ball_2: 46,
    lottery_ball_3: 50,
    lottery_ball_4: 51,
    lottery_ball_5: 52,
    lottery_ball_6: 55,
    lottery_ball_extra: 5,
    lottery_period: "2024-02-20",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 8,
    lottery_ball_2: 12,
    lottery_ball_3: 17,
    lottery_ball_4: 27,
    lottery_ball_5: 38,
    lottery_ball_6: 55,
    lottery_ball_extra: 47,
    lottery_period: "2024-02-17",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 3,
    lottery_ball_2: 7,
    lottery_ball_3: 8,
    lottery_ball_4: 18,
    lottery_ball_5: 21,
    lottery_ball_6: 26,
    lottery_ball_extra: 19,
    lottery_period: "2024-02-15",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_55
  },
  {
    lottery_ball_1: 8,
    lottery_ball_2: 17,
    lottery_ball_3: 22,
    lottery_ball_4: 31,
    lottery_ball_5: 34,
    lottery_ball_6: 49,
    lottery_ball_extra: 18,
    lottery_period: "2024-02-13",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_55
  },
  
  # 6/45
  { 
    lottery_ball_1: 1,
    lottery_ball_2: 3,
    lottery_ball_3: 5,
    lottery_ball_4: 26,
    lottery_ball_5: 30,
    lottery_ball_6: 42,
    lottery_period: "2024-03-17",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 9,
    lottery_ball_2: 11,
    lottery_ball_3: 16,
    lottery_ball_4: 29,
    lottery_ball_5: 31,
    lottery_ball_6: 33,
    lottery_period: "2024-03-15",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 1,
    lottery_ball_2: 13,
    lottery_ball_3: 25,
    lottery_ball_4: 30,
    lottery_ball_5: 34,
    lottery_ball_6: 40,
    lottery_period: "2024-03-13",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 4,
    lottery_ball_2: 12,
    lottery_ball_3: 19,
    lottery_ball_4: 23,
    lottery_ball_5: 36,
    lottery_ball_6: 41,
    lottery_period: "2024-03-10",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 2,
    lottery_ball_2: 26,
    lottery_ball_3: 28,
    lottery_ball_4: 40,
    lottery_ball_5: 41,
    lottery_ball_6: 45,
    lottery_period: "2024-03-08",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 11,
    lottery_ball_2: 15,
    lottery_ball_3: 34,
    lottery_ball_4: 39,
    lottery_ball_5: 41,
    lottery_ball_6: 43,
    lottery_period: "2024-03-06",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 3,
    lottery_ball_2: 10,
    lottery_ball_3: 17,
    lottery_ball_4: 20,
    lottery_ball_5: 22,
    lottery_ball_6: 27,
    lottery_period: "2024-03-03",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 20,
    lottery_ball_2: 22,
    lottery_ball_3: 24,
    lottery_ball_4: 26,
    lottery_ball_5: 28,
    lottery_ball_6: 37,
    lottery_period: "2024-03-01",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 1,
    lottery_ball_2: 10,
    lottery_ball_3: 21,
    lottery_ball_4: 25,
    lottery_ball_5: 32,
    lottery_ball_6: 39,
    lottery_period: "2024-02-28",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 5,
    lottery_ball_2: 7,
    lottery_ball_3: 10,
    lottery_ball_4: 12,
    lottery_ball_5: 15,
    lottery_ball_6: 26,
    lottery_period: "2024-02-25",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 4,
    lottery_ball_2: 17,
    lottery_ball_3: 19,
    lottery_ball_4: 27,
    lottery_ball_5: 28,
    lottery_ball_6: 36,
    lottery_period: "2024-02-23",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 2,
    lottery_ball_2: 8,
    lottery_ball_3: 14,
    lottery_ball_4: 19,
    lottery_ball_5: 24,
    lottery_ball_6: 42,
    lottery_period: "2024-02-21",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 5,
    lottery_ball_2: 19,
    lottery_ball_3: 20,
    lottery_ball_4: 21,
    lottery_ball_5: 24,
    lottery_ball_6: 40,
    lottery_period: "2024-02-18",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 6,
    lottery_ball_2: 10,
    lottery_ball_3: 16,
    lottery_ball_4: 20,
    lottery_ball_5: 40,
    lottery_ball_6: 42,
    lottery_period: "2024-02-16",
    number_of_spins_per_week: 2,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 8,
    lottery_ball_2: 9,
    lottery_ball_3: 11,
    lottery_ball_4: 12,
    lottery_ball_5: 40,
    lottery_ball_6: 44,
    lottery_period: "2024-02-14",
    number_of_spins_per_week: 1,
    status: Lottery::JACKPOT_6_45
  },
  { 
    lottery_ball_1: 7,
    lottery_ball_2: 18,
    lottery_ball_3: 31,
    lottery_ball_4: 33,
    lottery_ball_5: 35,
    lottery_ball_6: 41,
    lottery_period: "2024-02-11",
    number_of_spins_per_week: 3,
    status: Lottery::JACKPOT_6_45
  }
])