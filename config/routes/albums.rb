resources :albums, only: [:index, :show] do 
  resources :album_images, only: [:index]
end