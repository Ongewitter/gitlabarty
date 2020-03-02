require 'gitlabarty/version'
require 'gitlabarty/request'
require 'gitlabarty/configuration'

module Gitlabarty
  class Error < StandardError; end

  def self.post(options = {})
    Gitlabarty::Request.new(options).post
  end

  def self.configuration
    @configuration ||= Configuration.new
    block_given? ? yield(@configuration) : @configuration
  end
end
