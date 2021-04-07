class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :count

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @count = 0
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if @count != 1
      puts "You have guessed the sequence correctly #{@count} times"
    else
      puts "You have guessed the sequence correctly #{@count} time"
    end
    sleep(3)
    system("clear")
    show_sequence
    @sequence_length += 1
    if require_sequence
      @game_over = false
      round_success_message
      @count += 1
      sleep(1)
    else
      @game_over = true
    end
  end

  def show_sequence
    puts "Remember this sequence"
    sleep(2)
    system("clear")
    add_random_color
    @seq.each do |color| 
      puts color
      sleep(0.75)
      system("clear")
      sleep(0.25)
    end
  end

  def require_sequence
    puts "Please enter the sequence of colors. Accepts the first letter of the color name."
    @seq.all? {|color| color[0].downcase == gets.chomp[0].downcase}
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Great memory! Now, do it again."
  end

  def game_over_message
    puts "Game Over"
    puts "High Score: #{@count}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

simon_game = Simon.new
simon_game.play