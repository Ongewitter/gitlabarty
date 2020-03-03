require 'net/http'
require 'json'

module Gitlabarty
  class IssueRequest
    attr_accessor :id,
                  :params

    def issue_url
      "#{Gitlabarty.configuration.url}/#{Gitlabarty.configuration.id}/issues"
    end

    def initialize(id, params = {})
      @id = id
      default_params = { title: 'New Issue' }
      @params = default_params.merge(post_params(params))
    end

    def create
      post = Net::HTTP::Post.new("#{issue_url}?#{URI.encode_www_form(params)}")
      post['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      response = send_request(post)
      body = JSON.parse(response.body)
      self.id = body[:iid]
      puts body.to_s
    end

    def read
      return unless id

      get = Net::HTTP::Get.new("#{issue_url}/#{id}")
      get['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      response = send_request(get)
      puts JSON.parse(response.body).to_s
    end

    def update
      return unless id

      params = put_params(params)

      put = Net::HTTP::Put.new("#{issue_url}/#{id}?#{URI.encode_www_form(params)}")
      put['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      response = send_request(put)
      puts JSON.parse(response.body).to_s
    end

    def delete
      return unless id

      del = Net::HTTP::Delete.new("#{issue_url}/#{id}")
      del['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      response = send_request(del)
      puts JSON.parse(response.body).to_s
    end


    private

    def post_params(params)
      params.slice(:title, :description, :confidential, :assignee_ids,
                   :milestone_id, :labels, :created_at, :due_date, :merge_request_to_resolve_discussions_of,
                   :discussion_to_resolve, :weight, :epic_id, :epic_iid)
    end

    def put_params(params)
      params.slice(:title, :description, :confidential, :assignee_ids,
                   :milestone_id, :labels, :state_event, :updated_at, :due_date, :weight,
                   :discussion_locked, :epic_id, :epic_iid)
    end

    def send_request(request)
      response = nil
      uri = URI(Gitlabarty.configuration.url)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        response = http.request request
      end
      response
    end
  end
end
