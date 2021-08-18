    require_relative "../app/models/fetcher.rb"
    # "status":500
    # "error":"Internal Server Error"
    # "exception":"#\u003cJSON::ParserError: 767
    # Fetcher.new()
    # Fetcher.new("")
    # Fetcher.new("doesntwork")
    # Fetcher.new(123)
describe Fetcher do
    context "when initializing Fetcher" do
        it "is valid with declared :service" do
            request = Fetcher.new(:service => "twitter")
            expect(request).to be_valid
        end
        
        # it "is invalid without declared :service"
        # end

        # it "is invalid if :service isn't a string"
        # end

    end

end