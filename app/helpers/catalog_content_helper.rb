module CatalogContentHelper

	def addToCatalog(catalog)
        self.catalogs << catalog
        create_notification(catalog, 'addToCatalog')
    end

    def removeFromCatalog(catalog)
    	self.catalogs.delete(catalog)
        create_notification(catalog, 'removeFromCatalog')
    end

    private

    def create_notification(catalog, type)
    	Notification.create do | notification |
    		notification.notify_type = type
    		notification.actor = catalog.user
    		notification.user = self.user
    		notification.target = self
    		notification.second_target = catalog
    	end
    end

end