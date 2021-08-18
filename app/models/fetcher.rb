require 'net/http'
require 'net/https'
class Fetcher < ApplicationRecord
  validates :service, presence: true
  validates :service, format: { with: /[a-zA-Z]+/, message: "only allows for letters"}
  @@payload = {}
  @@base_uri = 'https://takehome.io/'

    def initialize(service)
      super
        begin
          response = Net::HTTP.get(URI(@@base_uri + self.service))         
          @@payload[self.service] = JSON.parse(response)

          rescue JSON::ParserError => e
            logger.error "ERROR: JSON ParseError -- #{e.to_s.split("\n").first}"
            if e.to_s.match?(/i am trapped/i)
              puts "Lassy is barking again... Is Timmy trapped in a social media factory?" 
              sleep 0.5
              puts "Retrying request..."
              retry
            end
            
          rescue TypeError => e
            if self.service.nil?
              logger.error "ERROR: Missing required parameter. 0 of 1"
            elsif self.service.class != "".class
              logger.error "Error: Incorrect parameter type, must be a string"
            else
              logger.error e.to_s.split("\n").first
            end

          rescue => e
            puts "Unexpected error!"
            logger.unknown e.to_s.split("\n").first

        end
    end
    def self.getPayload
      @@payload
    end
end