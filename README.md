# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.7.7
* Rails version 
  Rails 7.1.3.2
Decription project
- List Jackpot
- Recomment number suggestions for winning numbers

Api 
  - Api get list "/" = index 
      body {
        page: Number,
        per_page: Number
      }
  - Api post create "/create"
    In postman we will post params as follows:
      body 
      {
        lottery_ball_1: Number,
        lottery_ball_2: Number,
        lottery_ball_3: Number,
        lottery_ball_4: Number,
        lottery_ball_5: Number,
        lottery_ball_6: Number,
        lottery_ball_extra: Nil or number depending on status
        status: 45 or 55
        lottery_period: Date, Unique
        number_of_spins_per_week: Number 1 -> 3
      }
  - Api post get statistics  "/get-statistics"
    In postman we will post params as follows:
      body 
      {
        limit: 10
      }
      return list numbers data highest occurrence  