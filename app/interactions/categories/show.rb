class Categories::Show < BaseInteraction
  def execute
    category.presence || errors.add(:base, 'Unable to find category')
  end

  private

  def category
    @category ||= Category.find_by(id: params[:id])
  end
end
