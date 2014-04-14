module MiddlewareAutocomplete
  autoload :Base, 'middleware_autocomplete/base'
  autoload :Router, 'middleware_autocomplete/router'

  # Path namespace for autocompletes
  mattr_accessor :namespace
  @@namespace = '/autocompletes'

  # # Path namespace for autocompletes
  # mattr_accessor :namespace
  # @@namespace = '/autocompletes'
  # # Path namespace for autocompletes
  # mattr_accessor :namespace
  # @@namespace = '/autocompletes'
  # # Path namespace for autocompletes
  # mattr_accessor :namespace
  # @@namespace = '/autocompletes'
end

Dir[Rails.root.join 'app', 'autocompletes', '*.rb'].each { |f| require f }

ActiveSupport.on_load(:action_controller) do
  MiddlewareAutocomplete::Base.setup
end