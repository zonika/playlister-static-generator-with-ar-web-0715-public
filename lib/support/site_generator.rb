class SiteGenerator
  attr_reader :rendered_path
  def initialize(path)
    @rendered_path = path
  end

  def build_index
    template = File.read('./app/views/index.html.erb')
    erb = ERB.new(template)
    File.open(@rendered_path + "/index.html", "w+") { |file| file.puts erb.result(binding)}
  end

  def build_artists_index
    template = File.read('./app/views/artists/index.html.erb')
    erb = ERB.new(template)
    File.open(@rendered_path + "/artists/index.html", "w+") { |file| file.puts erb.result(binding)}
  end

  def build_genres_index
    template = File.read('./app/views/genres/index.html.erb')
    erb = ERB.new(template)
    File.open(@rendered_path + "/genres/index.html", "w+") { |file| file.puts erb.result(binding)}
  end

  def build_songs_index
    template = File.read('./app/views/songs/index.html.erb')
    erb = ERB.new(template)
    File.open(@rendered_path + "/songs/index.html", "w+") { |file| file.puts erb.result(binding)}
  end

  def build_artist_page
    template = File.read('./app/views/artists/show.html.erb')
    erb = ERB.new(template)
    Artist.all.each do |artist|
      File.open(@rendered_path + "/artists/#{artist.to_slug}.html","w+") { |file| file.puts erb.result(binding)}
    end
  end

  def build_genre_page
    template = File.read('./app/views/genres/show.html.erb')
    erb = ERB.new(template)
    Genre.all.each do |genre|
      File.open(@rendered_path + "/genres/#{genre.to_slug}.html","w+") { |file| file.puts erb.result(binding)}
    end
  end

  def build_song_page
    template = File.read('./app/views/songs/show.html.erb')
    erb = ERB.new(template)
    Song.all.each do |song|
      File.open(@rendered_path + "/songs/#{song.to_slug}.html","w+") { |file| file.puts erb.result(binding)}
    end
  end
end
