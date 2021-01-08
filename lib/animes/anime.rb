class Episode
    @@all = []

    attr_accessor :episode_id, :title, :aired
    
    def initialize(episode_id, title, aired)
        @episode_id = episode_id 
        @title = title
        @aired = aired 
        save
    
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    # a method that accepts the 

end
