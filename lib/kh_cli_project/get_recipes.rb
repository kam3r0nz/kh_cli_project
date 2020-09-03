require 'net/http'
require 'open-uri'
require 'json'

class KhCliProject::GetRecipes
    URL = "http://www.recipepuppy.com/api/"

    def get_data
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        results = JSON.parse(response.body)
        results["results"]
    end

    def create_recipes
        all_recipes = self.get_data
        all_recipes.map {|recipe| KhCliProject::Recipes.new(recipe["title"], recipe["href"], recipe["ingredients"], recipe["thumbnail"])}
    end
end