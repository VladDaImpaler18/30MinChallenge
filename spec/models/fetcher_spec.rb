require "rails_helper"
    # "status":500
    # "error":"Internal Server Error"
    # "exception":"#\u003cJSON::ParserError: 767
 
describe Fetcher do
    context "when initializing Fetcher" do
        it "is valid with a declared :service" do
            request = Fetcher.new(:service => "twitter")
            expect(request).to be_valid
        end
        
        it "is invalid without a declared :service" do
            request = Fetcher.new()
            expect(request).not_to be_valid
        end

        it "is invalid if :service isn't a string" do
            request = Fetcher.new(:service => 123)
            expect(request).not_to be_valid
        end

        it "has an error if :service an invalid service" do
            request = Fetcher.new(:service => "badLocation")
            expect(request).to raise_error
        end

    end

end