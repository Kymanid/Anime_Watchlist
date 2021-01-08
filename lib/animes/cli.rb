class CLI

    def start
        puts "Welcome to Beboptopia!"
        puts "Let's start with your name:"
        greet(user_input)
    end

    def user_input
        gets.strip
    end
    
    # Greeting Phrase + Exit + Menu input
    def greet(name)
        puts "I love your name #{name}! What episode would like to watch today?"
        puts "Please type 'm' to see a list of our menu options. Otherwise type 'leave' to exit the app!"
        anime_menu
    end
    
    # print out a list of search options
    def bebop_menu_list
        ["Cowboy Bebop Overview", "Episodes"].each.with_index(1) do |bebop, k|
            puts "#{k}. #{bebop}"
        end
        list_selection
    end

    # Phrase to exit the app
    def goodbye
        puts "Hate to see you go, hope you enjoyed your experience! See you soon!"
    end

    # Phrase when incorrect input is made
    def invalid
        puts "Hmm...Try again, Cowboy!"
        anime_menu
    end

    def list_selection
        puts "Select one of the options for more info!"

        selection = user_input

        puts "#{selection}"
    end


    def anime_menu
        selection = user_input

        if selection == 'm'
            bebop_menu_list
            anime_menu
        elsif selection == 'leave'
            goodbye
        else
            invalid
        end
    end

end
