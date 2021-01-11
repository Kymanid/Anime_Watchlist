class CLI

    # Intro 
    def start
        puts "Welcome to Beboptopia!"
        puts "Let's start with your name:"
        API.get_anime
        #binding.pry
        greet(user_input)
    end

    def user_input
        gets.strip
    end
    
    # Greeting | Menu options | Overview + Episode list 
    def greet(name)
        puts "I love your name #{name}! What would you like to do today?"
        puts "Please type 'e' for 'episode list', or 'o' for 'Overview'. Otherwise type 'exit' to leave the app!"
        anime_menu
    end
    
    # Overview Option 'o'
    def anime_overview
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Based on the worldwide phenomenon from Sunrise Inc., Cowboy Bebop is the jazz-inspired, genre-bending  
        story of Spike Spiegel, Jet Black, Faye Valentine, and Radical Ed: a ragtag crew of bounty hunters on the 
        run from their pasts as they hunt down the solar system’s most dangerous criminals. They’ll even save the 
        world… for the right price.
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts ""
        puts "If you like what your reading, input 'e' to check out the Cowboy Bebops episode library!"
        anime_menu
    end
    
    # EPISODE LIBARARY LIST - 26 Episodes 
    def bebop_episode_menu
            puts ""
            puts "----EPISODE LIBRARY----"
            puts ""
        Episode.all.each.with_index(+1) do |episode, i|
            puts "#{i}. #{episode.title}"
            puts ""
        end
        list_selection
    end
    

    # EPISODE SELECTION INPUT
    def list_selection
        puts "Please select a episode title for more details"

        selection = user_input
        
        episode = Episode.search_episodes(selection)
        
        anime_details(episode)

    end

    def anime_details(episode)
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Episode: #{episode.episode_id}"
        puts "Title: #{episode.title}"
        puts "Aired Date: #{episode.aired}"
        puts "Video link: #{episode.video_url}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts ""
        puts ""
        puts "press 'e' to reload list. or input 'exit' to leave the app"
        anime_menu
    end
        

    # Phrase to exit the app
    def goodbye
        puts "Hate to see you go, hope you enjoyed your experience! See you space cowboy!"
    end

    # Phrase when incorrect input is made
    def invalid
        puts "Hmm...Try again, cowboy!"
        anime_menu
    end


     def anime_menu
        selection = user_input

        if selection == 'e'
            bebop_episode_menu
            anime_menu
        
        elsif selection == 'o'
            anime_overview
            
        elsif selection == 'exit'
            goodbye
        else
            invalid
        end
    end

end

