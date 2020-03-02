require 'net/http'

module Gitlabarty
  class Request
    attr_accessor :header,
                  :title,
                  :milestone

    def post
      post = Net::HTTP::POST.new("#{url}/issues")
      post['PRIVATE-TOKEN'] = private_token
      post.set_form_data(
        'title' => title,
        'milestone' => milestone
      )

      post.request(req)
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
