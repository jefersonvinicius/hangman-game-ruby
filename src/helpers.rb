module Helpers 
    def draw_hidden_word(hidden_word, letters_attempted)
        hidden_word.split("").each { |letter|
            if letters_attempted.key?(letter)
                print letter
            else
                print "_"
            end
            print " "
        } 
        puts ""
    end

    def clear_console()
        system("clear")
    end

    def is_winner(hidden_word, letters_attempted)
        hidden_word.split("").all? {|letter| letters_attempted.key?(letter) }
    end

    def draw_scoreboard(score_board)
        entries = score_board.all_entries
        entries.each { |entry|
            puts "#{entry['hidden_word']}, #{entry['started_at']}, #{entry['finished_at']}, #{entry['is_winner']}"
        }
    end

    def load_words
        file = File.read(__dir__ + '/words.json')
        object = JSON.parse(file)
        return object['words']
    end 

    def take_time(seconds)
        if seconds >= 60
            minutes = seconds / 60
            rest = seconds % 60 
            if rest == 0
                return "#{minutes}min"
            else
                return "#{minutes}min #{rest}s"
            end
        end
        
        return "#{seconds}s"
    end
end
