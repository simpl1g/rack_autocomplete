class PostsAutocomplete
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['REQUEST_PATH'] == '/posts_autocomplete'
      request = Rack::Request.new(env)
      term = request.params['term']
      posts = ActiveRecord::Base.connection_pool.with_connection do
        Post.where("title LIKE ?", "#{term}_%").limit(10).pluck(:title)
      end
      [200, {'Content-Type' => 'application/json'}, [posts.to_json]]
    else
      @app.call(env)
    end
  end

end