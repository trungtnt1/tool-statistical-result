Rails.application.routes.draw do
  get '/', to: 'management_result#index'
  post 'create', to: 'management_result#create'
  post '/get-statistics', to: 'management_result#getRateStatistics'
end
