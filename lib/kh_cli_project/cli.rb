require_relative "./version.rb"

class KhCliProject::Cli
    def start
        KhCliProject::GetRecipes.new.create_recipes
        KhCliProject::Recipes.all
        options
    end

    def options
        puts "Please choose the recipe you would like more details about:"
        input = gets.chomp
        if input == "1"
            puts "These are the ingredients you will need to make this recipe......." 
        elsif input == "2"
            puts "These are the ingredients you will need to make this recipe......." 
        end
        puts "Would you like to view more recipes or exit? (more/exit)"
        input_2 = gets.chomp
        if input_2 == "more"
            start
        else
            puts "Goodbye!"
        end
    end
end