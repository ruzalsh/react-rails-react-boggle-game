Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :boggles

  post "get_possible_words" => "boggles#get_possible_words_from_string"
end
