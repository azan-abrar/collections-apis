class Categories::Create < BaseInteraction
  def execute
    return errors.add(:base, 'Unable to find vertical') if vertical.blank?

    category = vertical.categories.new(category_params)

    if category.save
      category
    else
      errors.add(:base, category.errors.full_messages.to_sentence)
    end
  end

  private

  def vertical
    @vertical ||= Vertical.find_by(id: params[:vertical_id])
  end

  def category_params
    params.require(:category).permit(:name, :state, courses_attributes: courses_attributes)
  end

  def courses_attributes
    %i[id name state author]
  end
end
