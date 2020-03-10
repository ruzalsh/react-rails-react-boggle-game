Rails.application.routes.draw do
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # handles simple validation, if input word exist in dictionary file it returns response as:
  #   {
  #     "status": "SUCCESS",
  #     "message": "valid word",
  #     "data": {
  #         "score": 3
  #     }
  # }
  post "check" => "boggles#validate_word_simple"

  # handles validation using DEPTH FIRST SEARCH algorithm,
  # if input word is valid among possible words that are scaned by ALGORITHM then it returns response as:
  #   {
  #     "status": "SUCCESS",
  #     "message": "valid word",
  #     "data": {
  #         "possibleWords": [
  #             "bed",
  #             "bad",
  #             "head"
  #         ],
  #         "isValid": true,
  #         "score": {
  #             "score": 3
  #         }
  #     }
  # }
  post "checkAlgo" => "boggles#validate_word_dfs_algo"

  # this is on process its main target is to provide alphabets that are pre-processed
  # and arranged on boggle so that validation of user input can be done faster and also for effeciency
  get "getBoggle" => "boggles#get_boggle"
end
