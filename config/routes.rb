Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "index#index"
  get "modulecounts.csv" => "index#index", format: "csv"
  get "repositories" => "repository#index", as: "index"
  get "repositories/:id/counts" => "repository#counts"
  get "repositories/:id/counts/:start/:finish" => "repository#counts"
end
