class KhCliProject::Cli
    def greeting
        puts "Hi! Welcome to the KH CLI Project!"
        puts "Please choose recipes or exit:"
        input = gets.chomp
        if input == "recipes"
            list_recipes
        elsif input == "exit"
            puts "Goodbye!"
        end
    end

    def list_recipes
        puts "1. Pan seared pork chops"
        puts "2. Orange chicken"
        puts "3. Mediterranean pizza"
    end

end