Rails.application.routes.draw do
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :boggles

  # post "get_possible_words" => "boggles#get_possible_words_from_string"
  post "check" => "boggles#validate_word_simple"
  post "checkAlgo" => "boggles#validate_word_dfs_algo"
  get "getBoggle" => "boggles#get_boggle"
end
