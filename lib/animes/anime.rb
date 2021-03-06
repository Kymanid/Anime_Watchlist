class Episode
    @@all = []

    attr_accessor :episode_id, :title, :aired, :video_url
    
    def initialize(episode_hash)
        episode_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end


    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.search_episodes(episode_id)
        self.all.find do |episode|
             episode.episode_id.to_s == episode_id
             
        end
    end

end
