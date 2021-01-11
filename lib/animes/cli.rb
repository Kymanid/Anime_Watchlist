class CLI

 
    def start
        puts "Welcome Space Cowboy!"
        puts "I don't think we've met before, what's your name?"
        API.get_anime
        greet(user_input)
    end

    def user_input
        gets.strip
    end
    
 
    def greet(name)
        puts ""
        puts "#{name}?! Are you a bounty hunter? Actually, i'd rather not know....hahaha!"
        puts "Anywho.....What can I help you with today #{name}?"
        puts ""
        puts "--------------- Please Input one of the following options -----------------"
        puts ""
        puts " 'e' = Access episode collection | 'o' = Overview | 'exit' = close the app "
        anime_menu
    end
    
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
        puts "If you like what you've read so far, input 'e' = Access episode collection"
        anime_menu
    end
    
    def bebop_episode_menu
            puts ""
            puts "----EPISODE LIBRARY----"
            puts ""
        Episode.all.each.with_index(1) do |episode|
            puts "#{episode.episode_id}"
            puts ""
        end
        list_selection
    end
    
    def list_selection
        puts "Please select a episode # for more details"

        selection = user_input
        
        episode = Episode.find_by_id(selection)
      
        
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
        puts "Please select one of the following to continue......"
        puts "'e' = reload list to select another ep. | 'o' = Overview | 'exit' to leave the app"
        anime_menu
    end
        
    def goodbye
        puts "Hate to see you go, hope you enjoyed your experience! See you space cowboy!" 
        exit
        
    end

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

