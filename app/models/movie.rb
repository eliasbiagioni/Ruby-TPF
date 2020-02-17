class Movie < ApplicationRecord
    extend Pagy::Search
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    include CatalogContentHelper

    belongs_to :user
    #has_and_belongs_to_many :movie_categories
    has_and_belongs_to_many :movie_categories
    has_one_attached :image
    has_and_belongs_to_many :catalogs

    validates_presence_of :title
    validates_presence_of :actors
    validates_presence_of :directors
    validates :image, attached: true, on: :create
    validates :movie_category_ids, :presence => true

end
