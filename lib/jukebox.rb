songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  song_choice = gets.chomp
  if song_choice.to_i == 0 && songs.include?(song_choice)
    puts "Playing #{song_choice}"
  elsif song_choice.to_i > 0 && song_choice.to_i < songs.length
    puts "Playing #{songs[song_choice.to_i - 1]}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  response = gets.chomp
  until response == "exit"
    case response
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    end
    puts "Please enter a command:"
    response = gets.chomp
  end
  exit_jukebox
end
