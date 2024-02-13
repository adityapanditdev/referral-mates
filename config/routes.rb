Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
                     controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }

  root 'components#index'

  resources :invitations, only: [:index, :create]

  # Route all unmatched paths to components#index
  get '*path', to: 'components#index', via: :all
end
