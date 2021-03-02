class BaseInteraction < ActiveInteraction::Base
  object :params, class: 'ActionController::Parameters'
end
