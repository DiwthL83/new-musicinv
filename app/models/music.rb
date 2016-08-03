class Music
	def initialize(name, id)
		@name = name
		@id = id
	end

	# Method to grab all records from the songs table in the database.
	#
	# Returns an array of hashes, with each hash representing a row of data from the songs table in the database.
	def self.all
		z = DB.execute('select rowid, * from songs')
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
	def self.albums
		z = DB.execute('select distinct album ,artist ,genre ,albumrating from songs')
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
	def self.artists
		z = DB.execute('select distinct from songs')
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
	def saveSong
		DB.execute('insert into songs (title,artist,album,genre,duration,songrating,albumrating,insert_tstamp) values ("#{@title}" ,"#{@artist}" ,"#{@talbum}" ,"#{@genre}" ,"#{@duration}" ,#{@songrating} ,#{@albumrating},strftime(\'%Y-%m-%d %H:%M:%S\',\'now\'))')
	end

	def deleteSong()
	end
end
