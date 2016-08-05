class Artist
	def initialize(title,artist,album,genre,duration,songrating,albumrating)
		# @id = id
		@title = title
		@artist = artist
		@album = album
		@genre = genre
		@duration = duration
		@songrating = songrating
		@albumrating = albumrating
	end
	
	#
	#
	#
	#
	#
	def self.all
		z = DB.execute('select * from artist')
		keys = %w(rowid title artist album genre duration songrating albumrating insert_tstamp)
		z.each do |y| 
			y.delete_if{|key, value| !keys.include?(key.to_s) } 
		end
	end

	#
	#
	#
	#
	#
	def saveNewArtist
		DB.execute("insert into songs (title,artist,album,genre,duration,songrating,albumrating,insert_tstamp) values (\"#{@title}\" ,\"#{@artist}\" ,\"#{@album}\" ,\"#{@genre}\" ,\"#{@duration}\" ,\"#{@songrating}\" ,\"#{@albumrating}\",strftime(\'%Y-%m-%d %H:%M:%S\',\'now\'))")
	end

end