module MiddlewareAutocomplete
  class Base
    class << self
      attr_accessor :namespace, :path, :route_name, :content_type, :search_key

      def setup
        klasses = descendants
        Rails.application.routes.eval_block(Proc.new do
          klasses.each do |klass|
            get klass.route => MiddlewareAutocomplete::Base.new, as: klass.route_name
          end
        end)
      end

      def route
        [namespace, path].join('/')
      end

      def path
        @path || default_path
      end

      def default_path
        name.demodulize.sub(/Autocomplete\Z/, '').underscore
      end

      def namespace
        @namespace || MiddlewareAutocomplete.namespace
      end

      def route_name
        @route_name || default_route_name
      end

      def default_route_name
        "autocomplete_#{default_path}"
      end
    end

    def call()
    end

    self.content_type = :json

  end
end