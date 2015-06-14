Rails.application.routes.draw do

  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  get 'contact' => 'static_pages#contact'
  get 'find' => 'flowers#find'
  get 'show_flower' => 'flowers#show'
  get 'flower_props' => 'flowers#props'
  get 'aquatic' => 'flowers#aquatic'

end
