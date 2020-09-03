class KhCliProject::Cli
    def start
        KhCliProject::GetRecipes.new.create_recipes
        greeting
        options
    end

    def greeting
        puts "- - - - - - - - - - - - - -"
        puts "- Welcome to RecipePuppy! -"
        puts "- - - - - - - - - - - - - -"
        puts ""
    end

    def options
        puts "Please choose an option: View recipes, search by ingredient, or exit? (recipes/ingredient/exit)"
        input = gets.chomp
        if input == "recipes"
            puts ""
            list_recipes
            puts ""
        elsif input == "ingredient"
            find_by_ingredient
        elsif input == "exit"
            puts ""
            puts "Goodbye! Hope to see you again."
            exit
        else
            puts "Sorry! I don't understand that response. Try again!"
            options
        end
    end

    def list_recipes
        KhCliProject::Recipes.all.each.with_index(1) {|recipe, index| puts "#{index}. #{recipe.name}"}
        puts ""
        puts "Please choose a recipe by number to view more details or exit:"
        input = gets.chomp
        index = input.to_i - 1
        puts ""
        if index >= 0 && index < KhCliProject::Recipes.all.length
            puts "- #{KhCliProject::Recipes.all[index].name} -"
            puts "• Ingredients: #{KhCliProject::Recipes.all[index].ingredients}"
            puts "• View full recipe: #{KhCliProject::Recipes.all[index].link}"
        elsif input == "exit"
            options
        else   
            puts "Sorry I don't understand that response. Try again!"
            puts ""
            list_recipes
        end
        puts ""
        ending
    end

    def find_by_ingredient
        puts ""
        puts "Which ingredient would you like to search for?"
        input = gets.chomp
        puts ""
        recipe = KhCliProject::Recipes.all.find {|recipe| recipe.ingredients.include?(input)}
        if !recipe
            puts ""
            puts "Sorry I could not find a recipe with that ingredient. Try again"
            puts ""
            find_by_ingredient
        end
        puts "- #{recipe.name} -"
        puts "• Ingredients: #{recipe.ingredients}"
        puts "• View full recipe: #{recipe.link}"
        puts ""
        options
    end

    def ending
        puts "Would you like to view another recipe or exit? (recipes/exit)"
        input = gets.chomp
        puts ""
        if input == "recipes"
            list_recipes
        elsif input == "exit"
            puts "Goodbye! Hope to see you again."
            exit
        else
            puts "Sorry I don't understand that response. Try again!"
            puts ""
        ending
        end
    end
end