require 'gitlabarty/version'
require 'gitlabarty/issuerequest'
require 'gitlabarty/configuration'

module Gitlabarty
  def self.create_issue(options = {})
    Gitlabarty::IssueRequest.create(options)
  end

  def self.configuration
    @configuration ||= Configuration.new
    block_given? ? yield(@configuration) : @configuration
  end
end
