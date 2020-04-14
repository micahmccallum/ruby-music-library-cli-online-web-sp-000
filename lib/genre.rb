class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def songs
    @songs
  end

  def artists
    collection = []
    @songs.each do |song|
      collection << song.artist unless collection.include?(song.artist)
    end
    collection
  end
end
