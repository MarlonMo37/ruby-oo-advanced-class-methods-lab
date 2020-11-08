class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name 
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(file)
    split  = file.split(" - ")
    artist_name = split[0]
    song_name_file = split[1]
    split_two = song_name_file.split(".")
    song_name = split_two[0]
    
    
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name 
    song
  end

    def self.create_from_filename(file)
      split  = file.split(" - ")
      artist_name = split[0]
      song_name_file = split[1]
      split_two = song_name_file.split(".")
      song_name = split_two[0]

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song
      
    end

    def self.destroy_all
      self.all.clear
    end

end
