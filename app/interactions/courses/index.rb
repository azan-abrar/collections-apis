class Courses::Index < BaseInteraction
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

    Course.search(query).records
  end

  private

  def build_filters
    if params[:category_id].present?
      { match: { category_id: params[:category_id] } }
    else
      { match_all: {} }
    end
  end
end
