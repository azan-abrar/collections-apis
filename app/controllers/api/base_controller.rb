class Api::BaseController < ApplicationController
  allow_oauth!

  def is_authorized?
    render json: {error: "Access is not granted!"}  unless (allow_oauth? && valid_oauth?)
  end
end
