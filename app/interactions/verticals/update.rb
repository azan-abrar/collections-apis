class Verticals::Update < BaseInteraction
  def execute
    return errors.add(:base, 'Unable to find vertical') if vertical.blank?

    if vertical.update(vertical_params)
      vertical
    else
      errors.add(:base, vertical.errors.full_messages.to_sentence)
    end
  end

  private

  def vertical
    @vertical ||= Vertical.find_by(id: params[:id])
  end

  def vertical_params
    params.require(:vertical).permit(:name, categories_attributes: categories_attributes)
  end

  def categories_attributes
    [:id, :name, :state, courses_attributes: courses_attributes]
  end

  def courses_attributes
    %i[id name state author]
  end
end