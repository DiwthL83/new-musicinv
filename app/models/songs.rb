class Songs
	def initialize(name, id)
		@name = name
		@id = id
	end

	def self.all
		DB.execute('select rowid, * from songs')
	end

	def add_song
		DB.execute('insert into songs (title,artist,album,genre,duration,songrating,albumrating,insert_tstamp) values ("#{@title}" ,"#{@artist}" ,"#{@talbum}" ,"#{@genre}" ,"#{@duration}" ,#{@songrating} ,#{@albumrating},strftime(\'%Y-%m-%d %H:%M:%S\',\'now\'))')
	end
end
