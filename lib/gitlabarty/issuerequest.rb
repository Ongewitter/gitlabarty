require 'net/http'

module Gitlabarty
  module IssueRequest
    def self.read(params = {})
      return unless params[:id]

      url = "#{Gitlabarty.configuration.url}/#{Gitlabarty.configuration.id}/issues/#{params[:id]}"

      get = Net::HTTP::Get.new("#{url}?#{URI.encode_www_form(params)}")
      get['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      send_request(get)
    end

    def self.create(params = {})
      default_params = { title: 'New Issue' }
      params = default_params.merge(post_params(params))
      url = "#{Gitlabarty.configuration.url}/#{Gitlabarty.configuration.id}/issues"

      post = Net::HTTP::Post.new("#{url}?#{URI.encode_www_form(params)}")
      post['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      send_request(post)
    end

    def self.update(params = {})
      return unless params[:id]

      params = put_params(params)
      url = "#{Gitlabarty.configuration.url}/#{Gitlabarty.configuration.id}/issues/#{params[:id]}"

      put = Net::HTTP::Put.new("#{url}?#{URI.encode_www_form(params)}")
      put['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      send_request(put)
    end

    def self.delete(params = {})
      return unless params[:id]

      url = "#{Gitlabarty.configuration.url}/#{Gitlabarty.configuration.id}/issues/#{params[:id]}"

      delete = Net::HTTP::Delete.new("#{url}?#{URI.encode_www_form(params)}")
      delete['PRIVATE-TOKEN'] = Gitlabarty.configuration.private_token

      send_request(delete)
    end

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
      uri = URI(Gitlabarty.configuration.url)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request request
      end
    end
  end
end
