#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

 my_songs = {
 "Go Go GO" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/04.mp3',
 "Wolf" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/05.mp3',
 "Blue" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '/home/lsamano/jukebox-cli-dumbo-web-121018/audio/Emerald-Park/07.mp3'
 }

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  songs = my_songs.keys
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  song_choice = gets.chomp
  if my_songs.has_key?(song_choice)
    puts "Playing #{song_choice}"
    system "open #{my_songs[song_choice]}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  puts "Please enter a command:"
  response = gets.chomp
  until response == "exit"
    case response
    when "help"
      help
    when "list"
      list(my_songs)
    when "play"
      play(my_songs)
    end
    puts "Please enter a command:"
    response = gets.chomp
  end
  exit_jukebox
end
