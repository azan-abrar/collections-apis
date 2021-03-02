class Verticals::Create < BaseInteraction
  def execute
    vertical = Vertical.new(vertical_params)
    if vertical.save
      vertical
    else
      errors.add(:base, vertical.errors.full_messages.to_sentence)
    end
  end

  private

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
