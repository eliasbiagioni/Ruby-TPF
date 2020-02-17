class CatalogCategory < ApplicationRecord
    has_many :catalogs

    validates_presence_of :name
end
