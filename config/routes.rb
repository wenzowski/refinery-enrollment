Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :enrollment do
    resources :courses, :only => [:index, :show]
  end

  # Admin routes
  namespace :enrollment, :path => '' do
    namespace :admin, :path => 'refinery/enrollment' do
      resources :courses, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
