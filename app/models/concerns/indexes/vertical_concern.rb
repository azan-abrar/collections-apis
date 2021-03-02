module Indexes::VerticalConcern
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: false do
        indexes :name, analyzer: 'english'
      end
    end
  end
end
