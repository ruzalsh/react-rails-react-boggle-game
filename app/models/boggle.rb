class Boggle < ApplicationRecord

    validates :words, presence: true
    validates :alphabets_on_boggle, presence: true
end