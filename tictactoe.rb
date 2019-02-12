require 'irb'

class TicTacToe

    attr_accessor :player1, :player2

    def initialize
      self.player1 = Array.new
      self.player2 = Array.new
    end

    def start
      while check_victory == false
        move_player1
        check_victory

        move_player2
        check_victory
      end
    end

    def move_player1
      input = gets.chomp.to_i
      puts "Player 1 plays: #{input}"
      save_move(input, player1)
      puts "Player 1 saved: #{player1}"
    end

    def move_player2
      input = gets.chomp.to_i
      puts "Player 2 plays: #{input}"
      save_move(input, player2)
      puts "Player 2 saved: #{player2}"
    end

    def check_victory
      if check_player_victory(player1)
        puts "GAME OVER Player 1 wins"
        return true
      elsif check_player_victory(player2)
        puts "GAME OVER Player 2 wins"
        return true        
      elsif draw
        puts "GAME OVER ITS A DRAW"
        return true
      else 
        return false
      end
    end

    def draw
      if player1.sum + player2.sum == 45
        return true
        puts "GAME IS A DRAW"
      else
        return false
      end
    end

    def save_move(input, player)
      if validate_move(input)
        player << input
        puts "Player moves:  #{player}"
        return true
      else
        puts "invalid move!  Give us another one:"
        input = gets.chomp.to_i
        validate_move(input)
        save_move(input, player)
      end
    end

    def validate_move(input)
      if [1,2,3,4,5,6,7,8,9].include?(input) && !player1.include?(input) && !player2.include?(input) 
        true
      else
        false
      end
    end

    def winning_conditions
      [ [1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7] ] 
    end

    def check_player_victory(player)
      winning_conditions.each do |condition|
        if player.reject { |i|  !condition.include?(i) }.sort == condition
          puts "gameover"
          return true
        end
      end
      return false
    end

end

TicTacToe.new.start