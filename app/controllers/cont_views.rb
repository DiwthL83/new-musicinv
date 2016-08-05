require 'pry'

MyApp.get "/" do

	erb :"/home"
end

MyApp.get "/songs" do
	@tbldata = Music.all

	erb :"/songs"
end

# ---- Controls for modify_recs below ----

MyApp.post "/add_song" do
	@title = params[:title_p]
	@artist = params[:artist_p]
	@album = params[:album_p]
	@genre = params[:genre_p]
	@duration = params[:duration_p]
	@songrating = params[:songrating_p]
	@albumrating = params[:albumrating_p]

	song_instance = Music.new(@title,@artist,@album,@genre,@duration,@songrating,@albumrating)

	song_instance.saveNewSong

	@tbldata = Music.all

  erb :"/songs"
end


MyApp.get "/add_song" do

	erb :"modify_recs/add_song"
end





# binding.pry
# puts 'Done'