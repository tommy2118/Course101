CARD_NAMES = (2..10).to_a + ["J", "Q", "K", "A"]
CARD_VALUES = (2..10).to_a + [10, 10, 10, 11]
SUITS = %w(Hearts Diamonds Spades Clubs)
def initialize_deck
  new_deck = {}
  counter = 0
  SUITS.each do |suit|
    CARD_NAMES.each do |name|
      new_deck[suit] ||= {}
      new_deck[suit][name] = CARD_VALUES[counter]
      if counter == CARD_VALUES.count - 1
        counter = 0
      else
        counter += 1
      end
    end
  end
  new_deck
end

deck = initialize_deck
puts deck.inspect
