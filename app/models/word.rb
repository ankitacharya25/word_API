class Word < ApplicationRecord
  has_many :definitions
  has_many :examples
  has_many :related_words
end
