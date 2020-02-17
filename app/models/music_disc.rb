class MusicDisc < ApplicationRecord
    extend Pagy::Search
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    include CatalogContentHelper

    has_and_belongs_to_many :music_categories
    has_and_belongs_to_many :songs
    has_one_attached :image
    belongs_to :user
    has_and_belongs_to_many :catalogs

    validates_presence_of :title
    validates_presence_of :discography
    validates_presence_of :group_name
    validates :image, attached: true, on: :create
    validates :music_category_ids, :presence => true

end
