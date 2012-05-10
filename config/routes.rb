Refinery::Core::Engine.routes.append do

  namespace :enrollment do
    root :to => "courses#index"
    resources :courses, :only => [:index, :show]
    resources :sessions, :only => [:index, :show]
  end

  namespace :enrollment, :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'enrollment' do
        root :to => "courses#index"

        resources :courses, :except => :show do
          collection do
            post :update_positions
          end
        end

        resources :sessions, :except => :show do
          collection do
            post :update_positions
          end
        end

        resources :settings do
          collection do
            get :notification_recipients
            post :notification_recipients
          end
        end

        resources :fees

      end
    end
  end

end
