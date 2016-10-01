require 'pry'
class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name if song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
     if !find_by_name(song_name)
       create_by_name(song_name)
     else
       find_by_name(song_name)
     end
  end

  def self.alphabetical
    all.sort_by! { |song_instances| song_instances.name }
  end

  def self.new_from_filename(file_nm_str)
    song = self.new
    file_nm_str.split(" - ").each do |split_filename|
      if split_filename.include?('.')
        song.name = split_filename.split(".").first
      else
        song.artist_name = split_filename
      end
    end
    song
  end

  def self.create_from_filename(file_nm_str)
    song = self.new_from_filename(file_nm_str)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
