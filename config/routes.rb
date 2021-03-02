Rails.application.routes.draw do
  mount_opro_oauth
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :verticals,  except: %i[new edit]
      resources :categories, except: %i[new edit]
      resources :courses,    except: %i[new edit]
    end
  end
  root to: proc { [200, {}, ['']] }
end
