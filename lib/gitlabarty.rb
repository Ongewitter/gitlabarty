require 'gitlabarty/version'
require 'gitlabarty/issuerequest'
require 'gitlabarty/configuration'

module Gitlabarty
  def self.create_issue(options = {})
    request = Gitlabarty::IssueRequest.new(params: options)
    request.create
  end

  def self.read_issue(id, *options)
    request = Gitlabarty::IssueRequest.new(id: id, params: options)
    request.read
  end

  def self.update_issue(id, *options)
    request = Gitlabarty::IssueRequest.new(id: id, params: options)
    request.update
  end

  def self.delete_issue(id, *options)
    request = Gitlabarty::IssueRequest.new(id: id, params: options)
    request.delete
  end

  def self.configuration
    @configuration ||= Configuration.new
    block_given? ? yield(@configuration) : @configuration
  end
end
