require 'pry'

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = (name)
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = (name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song
      song
    else
      create_by_name(name)
    end
    #binding.pry
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    name_array = filename.split(/[-.]/)
    #binding.pry
    song = new_by_name(name_array[1].strip)
    song.artist_name = name_array[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
