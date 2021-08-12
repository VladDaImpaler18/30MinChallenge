require 'net/http'
class Fetcher < ApplicationRecord
  @@base_uri = 'https://takehome.io/'
    def initialize(service)
        response = Net::HTPP.get(URI(@@base_uri+service))
        payload = JSON.parse(response)
        binding.pry

    end

end