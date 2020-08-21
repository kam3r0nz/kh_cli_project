class KhCliProject::Cli
    def start
        list_recipes
        options
    end

    def list_recipes
        puts "1. Ginger Champagne"
        puts "2. Potato and Cheese Frittata"
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
            call
        else
            puts "Goodbye!"
        end
    end
end