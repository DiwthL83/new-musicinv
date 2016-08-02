

MyApp.get "/" do

	erb :"/home"
end




MyApp.get "/songs" do
	@tbldata = Songs.all
	
	erb :"/songs"
end
