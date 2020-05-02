require 'pry'

class MusicLibraryController
   attr_reader :path 
  
  def initialize(path ='./db/mp3s')
      @path = path
      MusicImporter.new(path).import
   end 
  
     
    
 

 def list_songs
        Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    def list_artists
        Artist.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |artist, i|
        puts "#{i}. #{artist.name}"
        end
    end
    def list_genres
        Genre.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |genre, i|
        puts "#{i}. #{genre.name}"
        end
    end
    def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
       artist.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if genre = Genre.find_by_name(input)
          genre.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name}"
          end
        end
      end









    
    
  
      
     
 end