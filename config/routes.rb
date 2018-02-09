Rails.application.routes.draw do
  get 'sleepy/wait/:time' => 'sleepy#wait'
  get 'sleepy/stream/:time/:steps' => 'sleepy#stream'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
