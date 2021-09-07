class FetchersController < ApplicationController
    def index
        
        twitter = Fetcher.new(:service => "twitter")
        facebook = Fetcher.new(:service => "facebook")
        output = {}
        if twitter.errors.any?
            output["twitter"] = twitter.errors.full_messages
        else
            output["twitter"] = twitter.payload
        end
        if facebook.errors.any?
            output["facebook"] = facebook.errors.full_messages
        else
            output["facebook"] = facebook.payload
        end
           render json: output 
    end
end