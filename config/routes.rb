Rails.application.routes.draw do
  root "timesheets#index"

  resources :timesheets do
    resources :line_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
