class Score < ApplicationRecord
    attr_accessor :score

    def init(score)
        self.score = score
      end
end