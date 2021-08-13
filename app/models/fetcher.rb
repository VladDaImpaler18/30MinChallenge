require 'net/http'
require 'net/https'
class Fetcher < ApplicationRecord
  @@payload = {}
  @@base_uri = 'https://takehome.io/'
    def initialize(service)
        response = Net::HTTP.get(URI(@@base_uri + service))
        @@payload[service] = JSON.parse(response)
    end
    def self.getPayload
      @@payload
    end

end