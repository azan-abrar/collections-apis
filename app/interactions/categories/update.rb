class Categories::Update < BaseInteraction
  def execute
    return errors.add(:base, 'Unable to find vertical') if vertical.blank?
    return errors.add(:base, 'Unable to find category') if category.blank?

    if category.update(category_params)
      category
    else
      errors.add(:base, category.errors.full_messages.to_sentence)
    end
  end

  private

  def vertical
    @vertical ||= Vertical.find_by(id: params[:vertical_id])
  end

  def category
    @category ||= vertical.categories.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :state, courses_attributes: courses_attributes)
  end

  def courses_attributes
    %i[id name state author]
  end
end
