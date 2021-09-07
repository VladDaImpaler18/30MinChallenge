require 'net/http'
require 'net/https'
class Fetcher
  include ActiveModel::Model
  attr_accessor :service, :payload

  validates :service, presence: true
  validates :service, format: { with: /[a-zA-Z]+/, message: "only allows for letters"}

  @@base_uri = 'https://takehome.io/'

    def initialize(service)
      super
      get_data(service) unless errors.any?
      # valid? Default behavior clears error messages. https://github.com/rails/rails/blob/8ee716182df410052707c3d1eabf8bfd8e0e1c5e/activemodel/lib/active_model/validations.rb#L335-L343
    end

    def get_data(service)
      begin
        response = Net::HTTP.get(URI(@@base_uri + @service))         
        @payload = JSON.parse(response)

        rescue JSON::ParserError => e
          errors[:payload] << "JSON ParseError -- #{e.to_s.split("\n").first}"
          if e.to_s.match?(/i am trapped/i)
            puts "Lassy is barking again... Is Timmy trapped in a social media factory?" 
          end

        rescue => e
          errors[:base] << "Unexpected error! #{e.to_s.split("\n").first}"
      end
    end

end