module STumblr

  require 'httparty'

  class Blog
  
    attr_accessor :posts
    attr_accessor :title
    attr_accessor :description

    def initialize (blog_name, api_key)

      # Get the blog information for this blog

      info = HTTParty.get('http://api.tumblr.com/v2/blog/' + blog_name + '/info?api_key=' + api_key)

      if info.parsed_response['meta']['status'] == 200

        @title = info.parsed_response['response']['blog']['title']
        @description = info.parsed_response['response']['blog']['description']

        # Get the latest 5 posts
        latest = HTTParty.get('http://api.tumblr.com/v2/blog/' + blog_name + '/posts?limit=5&api_key=' + api_key)

        if latest.parsed_response['meta']['status'] == 200

          @posts = Array.new

          latest.parsed_response['response']['posts'].each do |p|
            new_post = STumblr::Post.new()
            new_post.title = p['title']
            new_post.content = p['body']
            new_post.timestamp = p['timestamp']

            @posts.push new_post

          end
            
        end
            
      end

    end
    
  end
end