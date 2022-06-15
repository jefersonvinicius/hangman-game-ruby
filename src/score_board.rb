module ScoreBoard
    class ScoreBoard
        FILE_PATH = "./scoreboard.json"
        
        def initialize()
            @entries = []
        end

        def load()
            if File.exists?(FILE_PATH)
                file = File.read(FILE_PATH)
                puts file
                @entries = JSON.parse(file)['scores']
            end
        end

        def add_winner(hidden_word, started_at, finished_at)
            add(hidden_word, started_at, finished_at, true)
        end

        def add_loser(hidden_word, started_at, finished_at)
            add(hidden_word, started_at, finished_at, false)
        end

        def all_entries
            return @entries
        end

        private

        def add(hidden_word, started_at, finished_at, is_winner)
            @entries.push({hidden_word: hidden_word, started_at: started_at,
                           finished_at: finished_at, is_winner: is_winner})
            
            File.write(FILE_PATH, {scores: @entries}.to_json)
        end
    end
end