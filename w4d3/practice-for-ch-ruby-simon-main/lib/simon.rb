class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    if @game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message if !@game_over
    @sequence_length += 1 
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
  end

  def game_over_message
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end