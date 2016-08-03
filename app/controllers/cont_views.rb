require 'pry'

MyApp.get "/" do

	erb :"/home"
end

MyApp.get "/songs" do
	@tbldata = Music.all
 
	erb :"/songs"
end


# binding.pry
# puts 'Done'