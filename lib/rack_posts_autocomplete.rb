class RackPostsAutocomplete

  def call(env)
    if env['REQUEST_PATH'] == '/autocomplete/posts'
      request = Rack::Request.new(env)
      posts = ActiveRecord::Base.connection_pool.with_connection do
        Post.where("title LIKE ?", "#{request.params['q']}_%").limit(10).pluck(:title)
      end
      [200, {'Content-Type' => 'application/json'}, [posts.to_json]]
    else
      [200, {'Content-Type' => 'application/text'}, [env['REQUEST_PATH']]]
    end
  end

end