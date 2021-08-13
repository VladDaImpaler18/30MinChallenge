class FetchersController < ApplicationController
    def index
        Fetcher.new("twitter")
        Fetcher.new("facebook")
        #Fetcher.new("instagram")
        render json: Fetcher.getPayload
    end
end