require_relative 'concerns/findable'
class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

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
    new(name).tap {|genre| genre.save}
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    binding.pry
    @songs.map {|song| song.artist }.uniq
  end

end
