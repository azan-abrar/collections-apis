Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :verticals,  except: %i[new edit]
      resources :categories, except: %i[new edit]
      resources :courses,    except: %i[new edit]
    end
  end
end
