module Gitlabarty
  class Configuration
    attr_accessor :url,
                  :private_token

    def initialize(options = {url: 'https://git.solvace.com/api/v4/projects/4', private_token: 'something'})
      self.url = options[:url]
      self.private_token = options[:private_token]
    end
  end
end
