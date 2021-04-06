class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      if i == 6 || i == 13
        next
      end
      4.times do 
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos] == nil
    raise "Starting cup is empty" if @cups[start_pos].length == 0

  end

  def make_move(start_pos, current_player_name)
    stones = []
    until @cups[start_pos].empty?
      stones << @cups[start_pos].shift
    end
    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i > 13
      if i == 6
        @cups[i] << stones.shift if @player_1 == current_player_name
      elsif i == 13 
        @cups[i] << stones.shift if @player_2 == current_player_name
      else
        @cups[i] << stones.shift
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
    # if ending_cup_idx == 6 || ending_cup_idx == 13
    #   # ended on store -- get to choose where to start again
    #   :prompt
    # elsif @cups[ending_cup_idx].count == 1
    #   # ended on empty cup -- switches players' turns
    #   :switch
    # else
    #   # ended on cup with stones in it -- automatically starts there
    #   ending_cup_idx
    # end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? {|i| @cups[i].empty?} || (7..12).all? {|i| @cups[i].empty?}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length
      return @player_1
    end
    @player_2
  end

end
