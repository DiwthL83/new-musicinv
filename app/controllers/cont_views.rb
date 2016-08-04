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

	# Instance created. Should I distinguish params and their variables with addl characters?
	song_instance = Music.new(@title,@artist,@album,@genre,@duration,@songrating,@albumrating)

	# binding.pry
	# Method call adds record to the songs table using the params in the song_instance. 
	song_instance.saveNewRec

  erb :"/songs"
end


MyApp.get "/add_song" do

	# TODO - Include a timed redirect somewhere in the process?

	erb :"modify_recs/add_song"
end





# binding.pry
# puts 'Done'