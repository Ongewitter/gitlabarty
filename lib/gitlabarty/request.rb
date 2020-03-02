require 'net/http'

module Gitlabarty
  class Request
    attr_accessor :title,
                  :description,
                  :milestone,
                  :labels

    def create_issue(params = {})
      post = Net::HTTP::Post.new("#{Gitlabarty.configuration.url}/issues")
      post['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      default_params = {'title' => 'New Issue'}
      post.set_form_data(default_params.merge(params))

      uri = URI(Gitlabarty.configuration.url)
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.request post
      end
    end

    # %w[get post put delete].each do |method|
    #   define_method method do |path, options = {}|
    #     params = options.dup

    #     http_config(params)

    #     unless params[:unauthenticated]
    #       params[:headers] ||= {}
    #       params[:headers].merge!(authorization_header)
    #     end

    #     validate self.class.send(method, @endpoint + path, params)
    #   end
    # end

    # private

    # def http_config

    # end
  end
end
