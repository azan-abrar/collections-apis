class Api::V1::CategoriesController < Api::BaseController
  def index
    run_interaction Categories::Index, each_serializer: CategorySerializer
  end

  def create
    run_interaction Categories::Create, serializer: CategorySerializer
  end

  def update
    run_interaction Categories::Update, serializer: CategorySerializer
  end

  def show 
    run_interaction Categories::Show, serializer: CategorySerializer
  end

  def destroy
    run_interaction Categories::Destroy
  end
end
