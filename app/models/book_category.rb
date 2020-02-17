class BookCategory < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_and_belongs_to_many :books

    validates_presence_of :name
end
