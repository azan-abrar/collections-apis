class Verticals::Index < BaseInteraction
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

    Vertical.search(query).records
  end

  private

  def build_filters
    { match_all: {} }
  end
end
