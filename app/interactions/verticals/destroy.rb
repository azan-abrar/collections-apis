class Verticals::Destroy < BaseInteraction
  def execute
    vertical&.destroy || errors.add(:base, 'Unable to find vertical')
  end

  private

  def vertical
    @vertical ||= Vertical.find_by(id: params[:id])
  end
end
