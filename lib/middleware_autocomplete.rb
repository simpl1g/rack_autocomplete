module MiddlewareAutocomplete
  autoload :Base, 'middleware_autocomplete/base'
  autoload :Router, 'middleware_autocomplete/router'

  # Path namespace for autocompletes
  mattr_accessor :namespace
  @@namespace = '/autocompletes'

  ROUTES = ActiveSupport::OrderedHash.new
end

Dir[Rails.root.join 'app', 'autocompletes', '*.rb'].each { |f| require f }

MiddlewareAutocomplete::Base.setup
