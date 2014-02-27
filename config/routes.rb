Beam::Application.routes.draw do

  resources :searches, only:[:create,:index]
  resources :sessions, only:[:index]
  root 'searches#index'
  get 'session/:action', :to => 'sessions'
  get 'searches/subscribe', :to => 'searches#subscribe', as: 'subscribe'

  get 'searches/do_subscribe', :to => 'searches#do_subscribe'
  resources :subs, only:[:index]
end
