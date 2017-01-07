Spree::Core::Engine.routes.draw do
  resources :fcontacts, :controller => 'fcontact_us/fcontacts', :only => [:new, :create]
  get 'fcontact-us' => 'fcontact_us/fcontacts#new', :as => :fcontact_us
end
