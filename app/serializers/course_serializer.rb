class CourseSerializer < ActiveModel::Serializer
  attributes :id, :category, :vertical, :name, :state, :author, :created_at, :updated_at

  def category
    object&.category&.name
  end

  def vertical
    object&.category&.vertical&.name
  end
end
