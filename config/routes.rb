Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :music_categories
  resources :movies
  resources :books
  resources :music_discs do
    get 'song/add/:song_id', to: 'music_discs#addSong', as: 'add_song'
    get 'song/remove/:song_id', to: 'music_discs#removeSong', as: 'remove_song'
  end
  resources :songs
  resources :movie_categories
  resources :book_categories
  resources :catalogs do
    put 'add_content', to: 'catalogs#addContent', as: :add_content, defaults: {format: :json}
    delete 'content', to: 'catalogs#removeContent', as: :remove_content, defaults: {format: :json}
  end
  resources :catalog_categories
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'catalogs/owns/all', to: 'catalogs#owns'
  get 'catalogs/add_content/:id', to: 'catalogs#getContents', as: :add_content
  mount Notifications::Engine => "/notifications"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
