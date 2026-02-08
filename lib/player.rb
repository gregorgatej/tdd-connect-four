module ConnectFour
  class Player
    attr_accessor :mark

    def initialize(mark)
      @mark = mark
    end

    def to_s
      "Player with mark \"#{mark}\""
    end
  end
end
