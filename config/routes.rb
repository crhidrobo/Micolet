Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #INICIO 
  root to: 'users#index'

  # RUTAS PARA CONTROLADOR DE USUARIO
  resources :users do
    collection do
      get :admin
    end
  end
  # RUTAS PARA CONTROLADOR DE preferencias
  resources :preferences
  # RUTAS PARA CONTROLADOR DE ENCUESTAS
  resources :surveys
  # RUTAS PARA CONTROLADOR DE RESPUESTAS
  resources :survery_answers
end
