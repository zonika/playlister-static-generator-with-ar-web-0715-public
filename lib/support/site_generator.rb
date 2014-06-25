class SiteGenerator
  attr_accessor :rendered_path
  def initialize(path)
    self.rendered_path = path
    FileUtils.mkdir_p "#{rendered_path}/artists"
    FileUtils.mkdir_p "#{rendered_path}/songs"
    FileUtils.mkdir_p "#{rendered_path}/genres"
  end

  def generate
    build_index
    ["artist", "genre", "song"].each do |type|
      self.send("build_#{type}s_index")
      self.send("build_#{type}_page")
    end
  end

  def render_template(file_path, file_name)
    abs_path = "#{Dir.pwd}/app/views"
    file_contents = File.read("#{abs_path}/#{file_path}")
    template = ERB.new(file_contents)
    # yield to instance variables for the file.
    yield
    rendered_html = template.result(binding)
    File.write(File.expand_path("#{rendered_path}/#{file_name}"), rendered_html)
  end

  def build_index
    render_template("index.html.erb", "index.html") do
      @artists = Artist.all
      @genres = Genre.all
      @songs = Song.all
    end
  end

  def build_artists_index
    render_template("artists/index.html.erb", "artists/index.html") do
      @artists = Artist.all
    end
  end

  def build_artist_page
    Artist.all.each do |artist|
      render_template("artists/show.html.erb", "artists/#{artist.to_slug}.html") do
        @artist = artist
      end
    end
  end

  def build_genres_index
    render_template("genres/index.html.erb", "genres/index.html") do
      @genres = Genre.all
    end
  end

  def build_genre_page
    Genre.all.each do |genre|
      render_template("genres/show.html.erb", "genres/#{genre.to_slug}.html") do
        @genre = genre
      end
    end
  end

  def build_songs_index
    render_template("songs/index.html.erb", "songs/index.html") do
      @songs = Song.all
    end
  end

  def build_song_page
    Song.all.each do |song|
      render_template("songs/show.html.erb", "songs/#{song.to_slug}.html") do
        @song = song
      end
    end
  end
end