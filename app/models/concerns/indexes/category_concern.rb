module Indexes::CategoryConcern
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: false do
        indexes :vertical_id
        indexes :name, analyzer: 'english'
        indexes :state
      end
    end
  end
end
