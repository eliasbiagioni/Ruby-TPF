class Song < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_and_belongs_to_many :music_discs
    belongs_to :music_category
    belongs_to :user

    validates_presence_of :title
    validates_associated :music_category

end
