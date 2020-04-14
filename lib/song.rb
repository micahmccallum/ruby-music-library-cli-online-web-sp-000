class Song
  attr_accessor :name, :artist, :genre



  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist_object)
    @artist = artist_object
    @artist.add_song(self)
  end

  def genre=(genre_object)
    @genre = genre_object
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    song = self.all.select{|song| song.name == song_name}
    # Song
  end

  def self.find_or_create_by_name(song_name)
    # self.find_by_name(song_name) || self.create(song_name)
  end

end
