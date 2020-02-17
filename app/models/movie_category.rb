class MovieCategory < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_and_belongs_to_many :movies

    validates_presence_of :name
end
