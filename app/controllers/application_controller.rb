class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

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
end
