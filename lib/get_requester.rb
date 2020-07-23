require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
  
    attr_accessor :url,:http,:response,:request
    
    def initialize(url)
      @url=url 
    end
  
    def get_response_body
        uri=URI.parse(url)
    
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
         people=JSON.parse(self.get_response_body)
         people.collect do |people|
          people["people"]
       end
    end

end 