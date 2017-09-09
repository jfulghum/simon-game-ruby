class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence # you get the round success message only if you don't lose!
    require_sequence
    unless @game_over #that's why it goes inside the loop.
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system('clear')
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by the first letter of each color on a new line."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true #
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.shuffle[0]

  end

  def round_success_message
    puts "You got it! Keep going!"
  end

  def game_over_message
    puts "You lasted #{@sequence_length -1} rounds! Keep practicing!"
    #I thought I didn't have to put the @ sign in front of everything?
    #becuase of attr_accessor?
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
