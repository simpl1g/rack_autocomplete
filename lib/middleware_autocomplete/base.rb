module MiddlewareAutocomplete
  class Base
    class << self
      attr_accessor :namespace, :path, :route_name, :content_type


      def setup
        descendants.each do |klass|

        end
      end
    end

    self.namespace = '/autocomplete'
    self.content_type = :json
  end
end