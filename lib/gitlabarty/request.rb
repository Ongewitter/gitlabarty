require 'net/http'

module Gitlabarty
  module IssueRequest
    def self.create(params = {})
      default_params = { 'title' => 'New Issue' }
      params = default_params.merge(params)

      post = Net::HTTP::Post.new("#{Gitlabarty.configuration.url}/issues?#{URI.encode_www_form(params)}")
      post['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      uri = URI(Gitlabarty.configuration.url)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request post
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
  end
end
