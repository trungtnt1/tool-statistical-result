Rails.application.routes.draw do
  get '/', to: 'management_result#index'
  post 'create', to: 'management_result#create'
  post '/get-statistics', to: 'management_result#getRateStatistics'
  post '/get-lucky-number', to: 'management_result#generateLuckyDraw'
  post '/get-lucky-number-follow-rules', to: 'management_result#generateLuckyDrawRule'
end