require 'net/http'
require 'open-uri'
require 'json'

require_relative "../kh_cli_project/recipes.rb"
require_relative "./version.rb"


class KhCliProject::GetRecipes
    URL = "http://www.recipepuppy.com/api/"

    def get_data
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        results = JSON.parse(response.body)
        recipes = results["results"]
    end

    def create_recipes
        all_recipes = self.get_data
        all_recipes.map do |recipe|
            KhCliProject::Recipes.new(recipe["title"], recipe["href"], recipe["ingredients"], recipe["thumbnail"])
        end
    end
end








