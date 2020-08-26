require_relative "./version.rb"

class KhCliProject::Cli
    def start
        KhCliProject::GetRecipes.new.create_recipes
        greeting
        options
    end

    def greeting
        puts "- - - - - - - - - - - - "
        puts "Welcome to RecipePuppy!"
        puts "- - - - - - - - - - - - "
        puts ""
    end

    def options
        puts "Please choose an option: List recipes or exit?"
        input = gets.chomp
        if input == "list" || input == "recipes" || input == "list recipes"
            puts ""
            list_recipes
            puts ""
        elsif input == "exit"
            puts ""
            puts "Goodbye!"
            exit
        else
            puts "Sorry! I don't understand that response. Try again!"
            options
        end
    end

    def list_recipes
        KhCliProject::Recipes.all.each.with_index(1) {|recipe, index| puts "#{index}. #{recipe.name}"}
        puts ""
        puts "Please choose a recipe by number to view the ingredients and the link to that recipe:"
        input = gets.chomp
        index = input.to_i - 1
        puts ""
        if index >= 0 && index < KhCliProject::Recipes.all.length
            puts KhCliProject::Recipes.all[index].name, KhCliProject::Recipes.all[index].ingredients,  KhCliProject::Recipes.all[index].link
        else
            puts "Sorry I don't understand that response. Try again!"
            puts ""
            list_recipes
        end
        puts ""
        ending
    end

    def ending
        puts "Would you like to view another recipe or exit? (recipes/exit)"
        input = gets.chomp
        puts ""
        if input == "recipes"
            list_recipes
        elsif input == "exit"
            puts "Goodbye! Hope to see you soon."
            exit
        else
            puts "Sorry I don't understand that response. Try again!"
            puts ""
        ending
        end
    end
end