require 'net/http'
require 'net/https'
class Fetcher < ApplicationRecord
  @@payload = {}
  @@base_uri = 'https://takehome.io/'

    def initialize(service)
        begin
          response = Net::HTTP.get(URI(@@base_uri + service))
          @@payload[service] = JSON.parse(response)

        rescue JSON::ParserError => e
          logger.error "ERROR: JSON ParseError -- #{e.to_s}"
          puts "Lassy is barking again... Is Timmy trapped in a social media factory?" if e.to_s.match?(/i am trapped/i)
          sleep 0.25
          puts "Retrying request..."
          retry

        rescue => e
          puts "Unexpected error!"
          logger.unknown e.to_s
          sleep 0.15
          puts "Retrying request..."
          retry

        end

    end
    def self.getPayload
      @@payload
    end

end