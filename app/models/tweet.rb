class Tweet < ApplicationRecord
    validates :message, presence: true
    validates :message, length: {minimum: 1, maximum: 141}
end