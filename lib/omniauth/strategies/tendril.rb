require 'omniauth/strategies/oauth2'
require 'faraday'
require 'multi_json'

module OmniAuth
  module Strategies
    class Tendril < OmniAuth::Strategies::OAuth2
      option :name, "tendril"

      option :client_options, {
        :site => 'https://dev.tendrilinc.com',
        :request_token_path => '/oauth/request_token',
        :access_token_path => '/oauth/access_token',
        :token_url => 'https://dev.tendrilinc.com/oauth/access_token',
        :token_method => :get,
        :authorize_url => 'https://dev.tendrilinc.com/oauth/authorize',
      }

      option :authorize_options, [:scope]

      uid{ raw_info['@id'] }

      info do
        {
          :first_name => raw_info['firstName'],
          :last_name => raw_info['lastName'],
          :name => "#{raw_info['firstName']} #{raw_info['lastName']}",
          :email => raw_info['emailAddress'],
          :user_name => raw_info['userName'],
          :using_temporary_password => raw_info['usingTemporaryPassword'],
          :expert => raw_info['expert'],
          :author_id => raw_info['authorId']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode user_info_request
      end

      protected

      def user_info_request
        conn = Faraday.new('https://dev.tendrilinc.com')
        response = conn.get do |req|
          req.url '/connect/user/current-user'
          req.headers['Accept'] = 'application/json'
          req.headers['Content-Type'] = 'application/json'
          req.headers['Access_Token'] = access_token.token
        end
        response.env[:body]
      end

    end
  end
end

