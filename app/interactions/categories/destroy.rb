class Categories::Destroy < BaseInteraction
  def execute
    category&.destroy || errors.add(:base, 'Unable to find category')
  end

  private

  def category
    @category ||= Category.find_by(id: params[:id])
  end
end
