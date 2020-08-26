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
            puts ""
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
        puts ""
        if input == "1"
            puts KhCliProject::Recipes.all[0].name, KhCliProject::Recipes.all[0].ingredients,  KhCliProject::Recipes.all[0].link
        elsif input == "2"
            puts KhCliProject::Recipes.all[1].name, KhCliProject::Recipes.all[1].ingredients,  KhCliProject::Recipes.all[1].link
        elsif input == "3"
            puts KhCliProject::Recipes.all[2].name, KhCliProject::Recipes.all[2].ingredients,  KhCliProject::Recipes.all[2].link
        elsif input == "4"
            puts KhCliProject::Recipes.all[3].name, KhCliProject::Recipes.all[3].ingredients,  KhCliProject::Recipes.all[3].link
        elsif input == "5"
            puts KhCliProject::Recipes.all[4].name, KhCliProject::Recipes.all[4].ingredients,  KhCliProject::Recipes.all[4].link
        elsif input == "6"
            puts KhCliProject::Recipes.all[5].name, KhCliProject::Recipes.all[5].ingredients,  KhCliProject::Recipes.all[5].link
        elsif input == "7"
            puts KhCliProject::Recipes.all[6].name, KhCliProject::Recipes.all[6].ingredients,  KhCliProject::Recipes.all[6].link
        elsif input == "8"
            puts KhCliProject::Recipes.all[7].name, KhCliProject::Recipes.all[7].ingredients,  KhCliProject::Recipes.all[7].link
        elsif input == "9"
            puts KhCliProject::Recipes.all[8].name, KhCliProject::Recipes.all[8].ingredients,  KhCliProject::Recipes.all[8].link
        elsif input == "10"
            puts KhCliProject::Recipes.all[9].name, KhCliProject::Recipes.all[9].ingredients,  KhCliProject::Recipes.all[9].link
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
        else
            puts "Sorry I don't understand that response. Try again!"
            puts ""
        ending
        end
    end
end