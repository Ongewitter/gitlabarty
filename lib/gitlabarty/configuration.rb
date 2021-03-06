module Gitlabarty
  class Configuration
    attr_accessor :url,
                  :id,
                  :private_token

    def initialize(options = {url: 'https://gitlab.example.com/api/v4/projects/', id: 1, private_token: 'something'})
      self.url = options[:url]
      self.id = options[:id]
      self.private_token = options[:private_token]
    end
  end
end
