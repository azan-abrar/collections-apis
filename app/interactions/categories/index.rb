class Categories::Index < BaseInteraction
  def execute
    query = {
      query: {
        bool: {
          must: [
            build_filters
          ]
        }
      }
    }

    Category.search(query).records
  end

  private

  def build_filters
    if params[:vertical_id].present?
      { match: { vertical_id: params[:vertical_id] } }
    else
      { match_all: {} }
    end
  end
end
