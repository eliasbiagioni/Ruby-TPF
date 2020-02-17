class MusicCategory < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_many :songs
    has_and_belongs_to_many :music_discs

    validates_presence_of :name
end
