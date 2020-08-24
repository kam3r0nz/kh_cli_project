require_relative "./version.rb"

class KhCliProject::Recipes
    attr_accessor :name, :link, :ingredients, :thumbnail

    @@all = []

    def initialize(name = nil, link = nil, ingredients = nil, thumbnail = nil)
        @name = name
        @link = link
        @ingredients = ingredients
        @thumbnail = thumbnail
        @@all << self
    end
    
    def self.all
        @@all
    end
end



