class CategorySerializer < ActiveModel::Serializer
  attributes :id, :vertical, :name, :state, :created_at, :updated_at

  def vertical
    object&.vertical&.name
  end
end
