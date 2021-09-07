class FetchersController < ApplicationController
    def index
        
        twitter = Fetcher.new(:service => "twitter")
        facebook = Fetcher.new(:service => "facebook")
        output = build_output([twitter, facebook])

        render json: output 
    end

    private
    def build_output(fetcher_instances)
        output = {}
        fetcher_instances.each do |instance|
            if instance.errors.any?
                output[instance.service] = instance.errors.full_messages
            else
                output[instance.service] = instance.payload
            end
        end
        output
    end
end