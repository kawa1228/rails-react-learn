Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    get 'things', to: 'things#index'
  end

  # RailsからAppコンポーネントにAPI以外のリクエストを送信
  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end

  # root to static controller
  root 'static#index'
end
