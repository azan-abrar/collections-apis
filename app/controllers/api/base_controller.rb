class Api::BaseController < ApplicationController
  allow_oauth!

  def run_interaction(interactor, render_options = {})
    outcome = interactor.run(params: params)

    respond_to do |format|
      if outcome.valid?
        format.html {}
        format.json {
          render({ json: outcome.result, status: :ok }.merge(render_options))
        }
      else
        format.html {}
        format.json {
          render({ json: { errors: outcome.errors.full_messages }, status: :bad_request })
        }
      end
    end
  end

  def is_authorized?
    render json: {error: "Access is not granted!"}  unless (allow_oauth? && valid_oauth?)
  end
end
