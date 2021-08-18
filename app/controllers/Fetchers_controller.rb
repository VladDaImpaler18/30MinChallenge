class FetchersController < ApplicationController
    def index
        Fetcher.new(:service => "twitter")
        Fetcher.new(:service => "facebook")
        # Fetcher.new(:service => "instagram")
        render json: Fetcher.getPayload
    end
end