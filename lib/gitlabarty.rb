require 'gitlabarty/version'
require 'gitlabarty/issuerequest'
require 'gitlabarty/configuration'

module Gitlabarty
  def self.read_issue(id)
    Gitlabarty::IssueRequest.read(id)
  end

  def self.create_issue(options = {})
    Gitlabarty::IssueRequest.create(options)
  end

  def self.update_issue(id, options = {})
    Gitlabarty::IssueRequest.update(id, options)
  end

  def self.delete_issue(id)
    Gitlabarty::IssueRequest.delete(id)
  end

  def self.configuration
    @configuration ||= Configuration.new
    block_given? ? yield(@configuration) : @configuration
  end
end
