Rails.application.routes.draw do
  get '/', to: 'management_result#index'
  post 'create', to: 'management_result#create'
end
