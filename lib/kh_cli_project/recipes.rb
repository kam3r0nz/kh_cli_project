require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class Recipes
    URL = "http://www.recipepuppy.com/api/"

    def get_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
        binding.pry
    end


end