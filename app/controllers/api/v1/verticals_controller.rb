class Api::V1::VerticalsController < Api::BaseController
  before_action :is_authorized?

  def index
    run_interaction Verticals::Index, each_serializer: VerticalSerializer
  end

  def create
    run_interaction Verticals::Create, serializer: VerticalSerializer
  end

  def update
    run_interaction Verticals::Update, serializer: VerticalSerializer
  end

  def show
    run_interaction Verticals::Show, serializer: VerticalSerializer
  end

  def destroy
    run_interaction Verticals::Destroy
  end
end
