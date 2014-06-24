class LibraryParser

  def self.parse_and_insert_songs_from(path)
    files = Dir.entries(path)[2..-1]
    files.each do |file|
      artist_name, song_name, genre_name = file.split(/\s-\s|\s\[|\]/)
      song = Song.new(name: song_name)
      song.artist = Artist.find_or_create(name: artist_name)
      song.genre = Genre.find_or_create(name: genre_name)
      song.save
    end
  end

end