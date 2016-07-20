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
    song = self.new     #initiate an instance
    self.all << song    #add the instance to the @@all class var
    song                #returns the song instance 
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.detect{|song_name| song_name.name == title}
  end

  def self.find_or_create_by_name(title)
    if(self.all.size == 0 || (self.name != title) )
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by{|object| object.name}
  end

  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    artist = song_info[0]
    name_song_mp3 = song_info[1]
    name_song = name_song_mp3.split(".mp3").join


    new_song = self.new
    new_song.name = name_song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    file = self.new_from_filename(file_name)
    self.all << file
  end

  def self.destroy_all
    self.all.clear
  end

end