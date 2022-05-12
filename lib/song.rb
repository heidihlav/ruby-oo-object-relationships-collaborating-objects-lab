require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        new_name = filename.split(" - ") 
        song = self.new(new_name[1])
        artist = Artist.find_or_create_by_name(new_name[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
end

    # binding.pry
