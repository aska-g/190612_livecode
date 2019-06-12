class SlotMachine
  def initialize
    @score_hash = {
      "joker" => {
        3 => 50,
        2 => 25
      },
      "star" => {
        3 => 40,
        2 => 20
      },
      "bell" => {
        3 => 30,
        2 => 15
      },
      "seven" => {
        3 => 20,
        2 => 10
      },
      "cherry" => {
        3 => 10,
        2 => 5
      }
    }
  end

  def score(array_of_tokens)
    # create a hash of possible game scores

    # check if tokens are allowed, otherwise score = 0
    allowed_tokens = @score_hash.keys
    return 0 unless array_of_tokens.all? { |token| allowed_tokens.include?(token) }

    # check if any token repeats, otherwise score = 0
    return 0 unless array_of_tokens.any? { |token| array_of_tokens.count(token) > 1 }

    # check if all tokens are the same
    if array_of_tokens.any? { |token| array_of_tokens.count(token) == 3 }
      return @score_hash[array_of_tokens[0]][3]
    end

    # when 2 tokens are the same, check if joker present
    if array_of_tokens.any? { |token| token == 'joker' }
      # return correct score for 2 jokers
      if array_of_tokens.count('joker') == 2
        return @score_hash['joker'][2]
      else
        # return correct score for 2 other tokens than the joker
        array_of_tokens.delete('joker')
        return @score_hash[array_of_tokens[0]][2]
      end
    else
      # if no joker present, score = 0 even if other 2 tokens are the same
      return 0
    end
  end
end
