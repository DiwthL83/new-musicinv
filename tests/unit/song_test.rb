require 'test_helper'

# Wipe the database before testing.
bundle exec rake test
rm musicdb_tst.db

class SongTest < Minitest::Test
  def setup
    super
    
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_find_by_id
  	# if add one song
  	# then if i take that song's ID
  	# and do Song.find with that song's ID
  	# i should get back a Song object that represents that row of data

  	DB.execute("INSERT INTO songs (title) VALUES ('Happy Birthday')")
  	last_id = DB.last_insert_row_id

  	song = Song.find(last_id)

  	refute_nil(song)
    assert_equal("Happy Birthday", song.title)
  end

  def test_deleting_a_user
  	# if i know of a certain song
  	# i can delete that song by its id
  	# then i should be able to verify that the song no longer exists
  	# also make sure that if we DONT delete a record, it can still be found.

		DB.execute("INSERT INTO songs (title) VALUES ('Twinkle Twinkle')")
  	id_1 = DB.last_insert_row_id

  	DB.execute("INSERT INTO songs (title) VALUES ('Happy Birthday')")
  	id_2 = DB.last_insert_row_id

  	Song.delete(id_2)

  	results_1 = DB.execute("SELECT * FROM songs WHERE id = #{id_1}")
  	results_2 = DB.execute("SELECT * FROM songs WHERE id = #{id_2}")

  	assert_equal(1, results_1.length)
  	assert_equal(0, results_2.length)
  end


  def test_get_artist_info
  	
  	DB.execute("insert into artist (name) values ('Jerry')")
  	artist_id = DB.last_insert_row_id

  	song = Song.new(0, "Some Title", artist_id)

  	# THIS IS WHAT WE WANT TO TEST
  	assert_equal("Jerry", song.artist_info["name"])
  	# test should result in the following: {"id" => 4, "name" => "Sumeet", "insert_ts" => 2389423}

  end
end