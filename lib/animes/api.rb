
class API
    def self.get_anime
        response = RestClient.get('https://api.jikan.moe/v3/anime/1/episodes/')
        episodes_array = JSON.parse(response)["episodes"]
        episodes_array.each do |episode|
            Episode.new(episode)
        end
    end
end
