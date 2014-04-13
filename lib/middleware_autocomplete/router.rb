module MiddlewareAutocomplete
  class Router
    def self.load
      Rails.application.routes.draw do
        Page.all.each do |pg|
          puts "Routing #{pg.name}"
          get "/#{pg.name}", :to => "pages#show", defaults: { id: pg.id }
        end
      end
    end

    def self.reload
      Rails.application.routes_reloader.reload!
    end
  end
end