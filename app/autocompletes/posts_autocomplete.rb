class PostsAutocomplete < MiddlewareAutocomplete::Base
  self.namespace = 'asd'

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['REQUEST_PATH'] == '/posts_autocomplete'
      request = Rack::Request.new(env)
      posts = ActiveRecord::Base.connection_pool.with_connection do
        Post.where("title LIKE ?", "#{request.params['q']}_%").limit(10).pluck(:title)
      end
      [200, {'Content-Type' => 'application/json'}, [posts.to_json]]
    else
      @app.call(env)
    end
  end

end