require 'pry'

MyApp.get "/" do

	erb :"/home"
end

MyApp.get "/songs" do
	@tbldata = Music.all
 
	erb :"/songs"
end

# ---- Controls for add forms below ----

MyApp.post "/add_song" do

	@titleParam = params[:titleParam]
	@artistParam = params[:artistParam]
	@albumParam = params[:albumParam]
	@genreParam = params[:genreParam]
	@minuteParam = params[:minuteParam]
	@secondParam = params[:secondParam]
	@rateSongParam = params[:rateSongParam]
	@rateAlbumParam = params[:rateAlbumParam]

	@song = Song.new(@titleParam,@artistParam,@albumParam,@genreParam,@minuteParam,@secondParam,@rateSongParam,@rateAlbumParam)

	# TODO - Replace song instance with new one directly below.
	saveNewRec(title,artist,album,genre,duration,songrating,albumrating)
	
	
	songinfo = @song.songinfo
	
	
	# TODO - Figure out why != doesn't work.
	if songinfo == "||||||||||||||"
	else
		songAdd2File(songinfo)
	end

	x = createFileArray()

  	erb :"/songs", :locals => {'x' => x}

end

MyApp.get "/add_song" do

	createFileWithHeader

	erb :"add_forms/add_song"

end
# binding.pry
# puts 'Done'