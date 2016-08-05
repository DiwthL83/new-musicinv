class Song
	attr_reader :id, :title, :artist, :album, :genre, :duration, :songrating, :albumrating, :insert_ts

	def initialize(id=nil, title=nil, artist=nil, album=nil, genre=nil, duration=nil, songrating=nil, albumrating=nil, insert_ts=nil)
		@id = id
		@title = title
		@artist = artist
		@album = album
		@genre = genre
		@duration = duration
		@songrating = songrating
		@albumrating = albumrating
		@insert_ts = insert_ts
	end

	# Find a record by its ID.
  # 
  # id = Integer of the ID to look for.
  # 
  # Returns a Song object with all of the corresponding record's details.
  def self.find(id)
    records = DB.execute("SELECT * FROM songs WHERE id = #{id}")
    record = records[0]

    self.new(record["id"], record["title"], record["artist"], record["album"], record["genre"], record["duration"], record["songrating"], record["albumrating"], record["insert_ts"])
  end

  # TODO 1) Write the same kind of documentatoin for this method
  # that Sumeet provided for the others methods.
  def artist_info
  	# get the rest of the information about artist # @artist

  	DB.execute("select * from artist where id=\"#{@artist}\"")[0]
  end

  # TODO 2) Write a CLASS METHOD called "self.all" that returns an Array
  # containing User objects. The Array should contain ALL OF THE ROWS from the DB (but of course
  # each row is represented as a User object.)

  # Delete a user.
  # 
  # id - Integer of song's ID.
  # 
  # Returns the Song object for the record that was just deleted.
  def self.delete(id)
  	record_to_delete = self.find(id)
  	DB.execute("DELETE FROM songs WHERE id = #{id}")
  	return record_to_delete
  end

	def songinfo
		@title = @title.split.map { |i| i.capitalize }.join(' ')
		@album = @album.split.map { |i| i.capitalize }.join(' ')
		@artist = @artist.split.map { |i| i.capitalize }.join(' ')
		return "#{@title}||#{@artist}||#{@album}||#{@genre}||#{@lengthmin}||#{@lengthsec}||#{@songrating}||#{@albumrating}\n"
	end

	# Method to grab all records from the songs table in the database.
	#
	# Returns an array of hashes, with each hash representing a row of data from the songs table in the database.
	def self.all
		z = DB.execute('select rowid, * from songs')
		keys = %w(rowid title artist album genre duration songrating albumrating insert_ts)
		z.each do |y| 
			y.delete_if{|key, value| !keys.include?(key.to_s) }
			 
		end
	end

	[
		<#User:3298vt348x3 @id=1, @name="Sumeet">,
		<#User:3298vt348x3 @id=2, @name="Sumeet">,
		<#User:3298vt348x3 @id=3, @name="Sumeet">,
		<#User:3298vt348x3 @id=4, @name="Sumeet">
	]

	#
	#
	#
	#
	#
	def saveNewSong
		DB.execute("insert into songs (title,artist,album,genre,duration,songrating,albumrating,insert_ts) values (\"#{@title}\" ,\"#{@artist}\" ,\"#{@album}\" ,\"#{@genre}\" ,\"#{@duration}\" ,\"#{@songrating}\" ,\"#{@albumrating}\",strftime(\'%Y-%m-%d %H:%M:%S\',\'now\'))")
	end

	def deleteSong
		DB.execute("delete from songs where title=\"#{@title}\" and album=\"#{@album}\"")
	end

end
