class Book < ApplicationRecord
    extend Pagy::Search
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    include CatalogContentHelper

    has_and_belongs_to_many :book_categories
    belongs_to :user
    has_one_attached :image
    has_and_belongs_to_many :catalogs

    validates_presence_of :title
    validates_presence_of :isbn
    validates_presence_of :author
    validates_presence_of :summary
    validates_presence_of :editorial
    validates :image, attached: true, on: :create
    validates :book_category_ids, :presence => true
end
