class User < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    ratyrate_rater
    
    has_many :catalogs
    has_many :songs
    has_many :books
    has_many :movies

    def self.sign_in_from_omniauth(auth)
        find_by(provider: auth['provider'],uid: auth['uid']) || create_user_from_omniauth(auth)
    end

    def self.create_user_from_omniauth(auth)
        create(
            provider: auth['provider'],
            uid: auth['uid'],
            name: auth['info']['name'],
            profile_image: auth['info']['image']
        )
    end

end
