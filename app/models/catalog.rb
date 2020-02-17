class Catalog < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    ratyrate_rateable 'content'

    belongs_to :user
    belongs_to :catalog_category
    has_one_attached :image
    has_and_belongs_to_many :books
    has_and_belongs_to_many :movies
    has_and_belongs_to_many :music_discs


    validates_presence_of :name
    validates :image, attached: true, on: :create
    validates_associated :catalog_category

    def self.list_public
        self.where({ :privacy => false })
    end

    def self.owns(id)
        self.where({ :user_id => id })
    end

    def empty?
        self.books.empty? && self.movies.empty? && self.music_discs.empty?
    end
end
