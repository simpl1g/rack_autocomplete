class PostsAutocomplete < MiddlewareAutocomplete::Base
  self.namespace = '/asd'

  def self.search(params)
    Post.where("title LIKE ?", "#{params['q']}_%").limit(10).pluck(:title).to_json
  end

end