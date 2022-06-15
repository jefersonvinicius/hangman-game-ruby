require 'time'
require 'json'
require_relative './helpers.rb'
require_relative './score_board.rb'

include Helpers
include ScoreBoard

words = Helpers.load_words

hidden_word = words[rand(words.length)].upcase
started_at = Time.now
letters_attempted = {}
hidden_word_letters = hidden_word.split("")
attempt = 5

score_board = ScoreBoard::ScoreBoard.new
score_board.load

is_debug = ARGV[0] == '--d'
ARGV.shift

while true 
    finished_at = Time.now
    
    Helpers.clear_console

    if is_debug
        puts "Hidden Word: #{hidden_word}"
    end

    if attempt == 0
        puts "The word was '#{hidden_word}'. You lost x__x"
        score_board.add_loser(hidden_word, started_at, finished_at)
        # Helpers.draw_scoreboard(score_board)
        break
    end

    if Helpers.is_winner(hidden_word, letters_attempted)
        seconds_taken = ((finished_at - started_at)).floor()
        puts "You win!!!!"
        puts "You take #{Helpers.take_time(seconds_taken)}"
        score_board.add_winner(hidden_word, started_at, finished_at)
        # Helpers.draw_scoreboard(score_board)
        break
    end

    Helpers.draw_hidden_word(hidden_word, letters_attempted)
    puts "Attempts #{attempt}"
    print "Letter: "
    letter = gets.chomp[0].upcase

    if letters_attempted.key?(letter)
        puts "The letter '#{letter}' already was choose!"
        sleep(1)
        next
    end

    letters_attempted[letter] = true
 
    if !hidden_word_letters.include?(letter)
        attempt -= 1
    end
end



